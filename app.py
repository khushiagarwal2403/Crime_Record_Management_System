from flask import Flask, render_template, request, redirect, url_for, session, flash
from db import get_connection
from functools import wraps

app = Flask(__name__)
app.secret_key = 'crms_secret_key_2024'

# ================
# LOGIN REQUIRED DECORATOR
# ================
def login_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        if 'user' not in session:
            return redirect(url_for('login'))
        return f(*args, **kwargs)
    return decorated

def admin_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        if 'user' not in session:
            return redirect(url_for('login'))
        if session['role'] != 'Admin':
            return redirect(url_for('index'))
        return f(*args, **kwargs)
    return decorated

# ================
# LOGIN / LOGOUT
# ================
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("""
            SELECT * FROM Users WHERE username=%s AND password=%s
        """, (username, password))
        user = cursor.fetchone()
        conn.close()
        if user:
            session['user'] = user['username']
            session['role'] = user['role']
            session['user_id'] = user['user_id']
            return redirect(url_for('index'))
        else:
            flash('Invalid username or password!', 'error')
    return render_template('login.html')

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('login'))

# ================
# DASHBOARD
# ================
@app.route('/')
@login_required
def index():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("SELECT COUNT(*) AS total FROM FIR")
    total_fir = cursor.fetchone()['total']

    cursor.execute("SELECT COUNT(*) AS total FROM Criminal WHERE status='Wanted'")
    wanted = cursor.fetchone()['total']

    cursor.execute("SELECT COUNT(*) AS total FROM FIR WHERE status='Closed'")
    solved = cursor.fetchone()['total']

    cursor.execute("SELECT COUNT(*) AS total FROM FIR WHERE status='Under Investigation'")
    investigating = cursor.fetchone()['total']

    cursor.execute("SELECT COUNT(*) AS total FROM FIR WHERE status='Open'")
    open_cases = cursor.fetchone()['total']

    cursor.execute("SELECT COUNT(*) AS total FROM Officer")
    total_officers = cursor.fetchone()['total']

    # Chart data - crimes by type
    cursor.execute("""
        SELECT crime_type, COUNT(*) as total 
        FROM FIR GROUP BY crime_type 
        ORDER BY total DESC LIMIT 6
    """)
    crime_stats = cursor.fetchall()

    # Chart data - monthly crimes
    cursor.execute("""
        SELECT MONTHNAME(date) as month, COUNT(*) as total
        FROM FIR 
        GROUP BY MONTH(date), MONTHNAME(date)
        ORDER BY MONTH(date)
    """)
    monthly_stats = cursor.fetchall()

    # Recent FIRs
    cursor.execute("""
        SELECT f.fir_id, f.date, f.crime_type, f.location,
               f.status, v.name as victim_name
        FROM FIR f JOIN Victim v ON f.victim_id = v.victim_id
        ORDER BY f.date DESC LIMIT 5
    """)
    recent_firs = cursor.fetchall()

    conn.close()
    return render_template('index.html',
        total_fir=total_fir,
        wanted=wanted,
        solved=solved,
        investigating=investigating,
        open_cases=open_cases,
        total_officers=total_officers,
        crime_stats=crime_stats,
        monthly_stats=monthly_stats,
        recent_firs=recent_firs
    )

# ================
# FIR ROUTES
# ================
@app.route('/fir')
@login_required
def fir_list():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    status = request.args.get('status', '')
    if status:
        cursor.execute("""
            SELECT f.fir_id, f.date, f.crime_type, f.location,
                   f.status, v.name as victim_name, o.name as officer_name
            FROM FIR f
            JOIN Victim v ON f.victim_id = v.victim_id
            JOIN Officer o ON f.officer_id = o.officer_id
            WHERE f.status = %s
            ORDER BY f.date DESC
        """, (status,))
    else:
        cursor.execute("""
            SELECT f.fir_id, f.date, f.crime_type, f.location,
                   f.status, v.name as victim_name, o.name as officer_name
            FROM FIR f
            JOIN Victim v ON f.victim_id = v.victim_id
            JOIN Officer o ON f.officer_id = o.officer_id
            ORDER BY f.date DESC
        """)
    firs = cursor.fetchall()
    conn.close()
    return render_template('fir.html', firs=firs)

@app.route('/fir/add', methods=['GET', 'POST'])
@login_required
def add_fir():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    if request.method == 'POST':
        date = request.form['date']
        time = request.form['time']
        location = request.form['location']
        crime_type = request.form['crime_type']
        description = request.form['description']
        victim_id = request.form['victim_id']
        officer_id = request.form['officer_id']
        cursor.execute("""
            INSERT INTO FIR(date, time, location, crime_type, description, status, victim_id, officer_id)
            VALUES(%s, %s, %s, %s, %s, 'Open', %s, %s)
        """, (date, time, location, crime_type, description, victim_id, officer_id))
        conn.commit()
        conn.close()
        flash('FIR registered successfully!', 'success')
        return redirect(url_for('fir_list'))

    cursor.execute("SELECT victim_id, name FROM Victim ORDER BY name")
    victims = cursor.fetchall()
    cursor.execute("SELECT officer_id, name, rank FROM Officer ORDER BY name")
    officers = cursor.fetchall()
    conn.close()
    return render_template('add_fir.html', victims=victims, officers=officers)

# ================
# CRIMINALS ROUTES
# ================
@app.route('/criminals')
@login_required
def criminals_list():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    search = request.args.get('search', '')
    if search:
        cursor.execute("""
            SELECT * FROM Criminal
            WHERE name LIKE %s
            OR status LIKE %s
            OR address LIKE %s
            OR fingerprint_id LIKE %s
        """, ('%'+search+'%','%'+search+'%','%'+search+'%','%'+search+'%'))
    else:
        cursor.execute("SELECT * FROM Criminal ORDER BY criminal_id")
    criminals = cursor.fetchall()
    conn.close()
    return render_template('criminals.html', criminals=criminals, search=search)

# ← PASTE NEW ROUTE HERE ↓
@app.route('/criminals/add', methods=['GET', 'POST'])
@login_required
def add_criminal():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    if request.method == 'POST':
        name        = request.form['name']
        dob         = request.form['dob']
        gender      = request.form['gender']
        address     = request.form['address']
        fingerprint = request.form['fingerprint_id']
        status      = request.form['status']
        cursor.execute("""
            INSERT INTO Criminal(name, dob, gender, address, fingerprint_id, status)
            VALUES(%s, %s, %s, %s, %s, %s)
        """, (name, dob, gender, address, fingerprint, status))
        conn.commit()
        conn.close()
        flash('Criminal record added successfully!', 'success')
        return redirect(url_for('criminals_list'))
    conn.close()
    return render_template('add_criminal.html')

# ================
# OFFICERS ROUTES  
# ================
@app.route('/officers')
@login_required
def officers_list():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("""
        SELECT o.officer_id, o.name, o.rank, o.badge_no,
               o.contact, s.name as station_name, s.district
        FROM Officer o
        JOIN Station s ON o.station_id = s.station_id
        ORDER BY o.officer_id
    """)
    officers = cursor.fetchall()
    conn.close()
    return render_template('officers.html', officers=officers)
@app.route('/officers/add', methods=['GET', 'POST'])
@login_required
def add_officer():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    if request.method == 'POST':
        name       = request.form['name']
        rank       = request.form['rank']
        badge_no   = request.form['badge_no']
        station_id = request.form['station_id']
        contact    = request.form['contact']
        cursor.execute("""
            INSERT INTO Officer(name, rank, badge_no, station_id, contact)
            VALUES(%s, %s, %s, %s, %s)
        """, (name, rank, badge_no, station_id, contact))
        conn.commit()
        conn.close()
        flash('Officer added successfully!', 'success')
        return redirect(url_for('officers_list'))
    cursor.execute("SELECT station_id, name, district FROM Station ORDER BY name")
    stations = cursor.fetchall()
    conn.close()
    return render_template('add_officer.html', stations=stations)

# ================
# COURT CASES
# ================
@app.route('/cases')
@login_required
def cases_list():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("""
        SELECT cc.case_id, cc.judge_name, cc.hearing_date,
               cc.verdict, cc.sentence,
               f.crime_type, f.location,
               v.name as victim_name
        FROM Court_Case cc
        JOIN FIR f ON cc.fir_id = f.fir_id
        JOIN Victim v ON f.victim_id = v.victim_id
        ORDER BY cc.hearing_date DESC
    """)
    cases = cursor.fetchall()
    conn.close()
    return render_template('cases.html', cases=cases)

# ================
# EXPORT PDF
# ================
@app.route('/export/fir')
@login_required
def export_fir():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("""
        SELECT f.fir_id, f.date, f.time, f.crime_type, f.location,
               f.description, f.status,
               v.name as victim_name, v.contact as victim_contact,
               o.name as officer_name, o.rank as officer_rank
        FROM FIR f
        JOIN Victim v ON f.victim_id = v.victim_id
        JOIN Officer o ON f.officer_id = o.officer_id
        ORDER BY f.date DESC
    """)
    firs = cursor.fetchall()
    conn.close()
    return render_template('export_fir.html', firs=firs)

if __name__ == '__main__':
    app.run(debug=True)