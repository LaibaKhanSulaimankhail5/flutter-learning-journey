<!-- Font Awesome Icons & Inter Font -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<style>
  :root {
    --primary: #2f6fed;
    --primary-dark: #1d4ed8;
    --primary-light: #eaf2ff;
    --primary-lighter: #cfe0ff;
    --dark: #1e3a8a;
    --text-dark: #1e293b;
    --text-muted: #64748b;
    --bg-light: #f8fafc;
    --card-bg: #ffffff;
    --border-color: #e5eaf1;
  }

  * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Inter', sans-serif; }
  body { color: var(--text-dark); background-color: #ffffff; line-height: 1.6; }
  .container { max-width: 1200px; margin: 0 auto; padding: 0 20px; }

  /* Navbar — STICKY */
  .navbar { position: sticky; top: 0; z-index: 100; background: #ffffff; display: flex; justify-content: space-between; align-items: center; padding: 16px 0; border-bottom: 1px solid var(--border-color); box-shadow: 0 1px 0 rgba(15,23,42,0.03); }
  .logo { display: flex; align-items: center; gap: 12px; text-decoration: none; }
  .logo-icon { width: 42px; height: 42px; border-radius: 12px; object-fit: cover; }
  .logo-text h3 { color: var(--text-dark); font-size: 18px; line-height: 1.2; }
  .logo-text span { font-size: 11px; color: var(--text-muted); }
  .nav-links { display: flex; gap: 26px; align-items: center; list-style: none; }
  .nav-links a { text-decoration: none; color: var(--text-dark); font-weight: 500; font-size: 15px; transition: .2s; }
  .nav-links a:hover, .nav-links a.active { color: var(--primary); }
  .nav-actions { display: flex; align-items: center; gap: 20px; }

  /* Buttons */
  .btn-primary { background: var(--primary); color: white; padding: 11px 22px; border-radius: 10px; text-decoration: none; font-weight: 600; font-size: 14px; transition: .2s; display: inline-flex; align-items: center; gap: 8px; border: none; cursor: pointer; }
  .btn-primary:hover { background: var(--primary-dark); box-shadow: 0 8px 20px rgba(47,111,237,.25); transform: translateY(-2px); }
  .btn-outline { background: #fff; color: var(--primary); border: 1px solid var(--primary-lighter); padding: 11px 22px; border-radius: 10px; text-decoration: none; font-weight: 600; font-size: 14px; display: inline-flex; align-items: center; gap: 8px; transition: .2s; }
  .btn-outline:hover { background: var(--primary-light); transform: translateY(-2px); }
  .btn-lg { padding: 15px 30px; font-size: 16px; }

  /* Badge */
  .badge { display: inline-flex; align-items: center; gap: 8px; background: var(--primary-light); color: var(--primary); font-weight: 600; font-size: 13px; letter-spacing: .3px; text-transform: uppercase; padding: 7px 16px; border-radius: 999px; margin-bottom: 18px; }
  .badge-dot { position: relative; display: inline-flex; width: 8px; height: 8px; }
  .badge-dot span { position: absolute; inset: 0; border-radius: 50%; background: var(--primary); }
  .badge-dot .ping { background: var(--primary); opacity: .6; animation: ping 1.5s cubic-bezier(0,0,.2,1) infinite; }
  @keyframes ping { 75%,100% { transform: scale(2.2); opacity: 0; } }

  /* Hero (About/Services-style, centered, soft panel) */
  .hero-section { text-align: center; max-width: 850px; margin: 40px auto; padding: 60px 30px; background: linear-gradient(180deg, var(--primary-light), #ffffff); border-radius: 24px; }
  .hero-title { font-size: 40px; font-weight: 700; margin-bottom: 18px; }
  .hero-desc { color: var(--text-muted); font-size: 17px; }

  /* Hero (Home-style, two column, soft panel) */
  .hero-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 50px; align-items: center; padding: 50px 40px; margin: 30px 0; background: linear-gradient(135deg, var(--primary-light), #ffffff); border-radius: 24px; }
  .hero-grid .hero-title { text-align: left; font-size: 44px; }
  .hero-grid .hero-desc { text-align: left; max-width: 480px; }
  .gradient-text { color: var(--primary); }
  .hero-btns { display: flex; gap: 14px; margin-top: 28px; flex-wrap: wrap; }
  .hero-note { margin-top: 18px; font-size: 14px; color: var(--text-muted); }

  /* Dashboard mock card */
  .dashboard-card { border: 1px solid var(--border-color); background: #fff; border-radius: 18px; padding: 24px; box-shadow: 0 12px 30px rgba(15,23,42,.08); }
  .dash-header { display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid var(--border-color); padding-bottom: 14px; margin-bottom: 14px; }
  .dash-title { font-size: 14px; font-weight: 600; }
  .dash-status { background: var(--primary-light); color: var(--primary); padding: 3px 10px; border-radius: 999px; font-size: 12px; font-weight: 600; }
  .dash-stats { display: grid; grid-template-columns: 1fr 1fr; gap: 12px; }
  .dash-stat { background: var(--bg-light); border: 1px solid var(--border-color); border-radius: 10px; padding: 12px; }
  .dash-stat p:first-child { font-size: 12px; color: var(--text-muted); }
  .dash-stat p:last-child { font-size: 17px; font-weight: 700; margin-top: 4px; color: var(--text-dark); }
  .dash-chart { margin-top: 14px; background: var(--bg-light); border: 1px solid var(--border-color); border-radius: 10px; padding: 12px; }
  .chart-bars { display: flex; align-items: flex-end; gap: 6px; height: 70px; }
  .chart-bar { flex: 1; border-radius: 4px 4px 0 0; background: linear-gradient(to top, var(--primary), var(--primary-lighter)); }
  .chart-label { margin-top: 8px; font-size: 12px; color: var(--text-muted); }

  /* Trust bar */
  .trust-bar { border-top: 1px solid var(--border-color); border-bottom: 1px solid var(--border-color); margin: 20px 0; }
  .trust-grid { display: grid; grid-template-columns: repeat(4, 1fr); }
  .trust-stat { text-align: center; padding: 30px 10px; border-right: 1px solid var(--border-color); }
  .trust-stat:last-child { border-right: none; }
  .trust-value { font-size: 28px; font-weight: 800; color: var(--primary); }
  .trust-label { font-size: 13px; color: var(--text-muted); margin-top: 4px; text-transform: uppercase; letter-spacing: .5px; }

  /* Section heading */
  .section { padding: 60px 0; }
  .section-head { text-align: center; max-width: 620px; margin: 0 auto 40px; }
  .section-head h2 { font-size: 30px; margin-top: 4px; }

  /* Stats grid */
  .stats-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 20px; margin: 40px 0; }
  .stat-card { background: var(--bg-light); padding: 28px; border-radius: 14px; border: 1px solid var(--border-color); text-align: center; }
  .stat-card h2 { font-size: 34px; color: var(--primary); }
  .stat-card p { color: var(--text-muted); font-size: 14px; }

  /* Cards grid (team / services / why-us) */
  .team-section { padding: 50px 0; }
  .cards-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 26px; margin-top: 40px; }
  .card { border: 1px solid var(--border-color); border-radius: 16px; padding: 30px; background: var(--card-bg); transition: .25s; }
  .card:hover { transform: translateY(-5px); box-shadow: 0 16px 32px rgba(47,111,237,.12); border-color: var(--primary-lighter); }
  .card-icon { width: 46px; height: 46px; background: var(--primary-light); color: var(--primary); border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 19px; margin-bottom: 18px; }
  .card h3 { font-size: 19px; margin-bottom: 10px; }
  .card p { color: var(--text-muted); font-size: 14.5px; margin-bottom: 18px; }
  .feature-list { list-style: none; margin-bottom: 20px; }
  .feature-list li { display: flex; align-items: center; gap: 10px; font-size: 14px; margin-bottom: 10px; }
  .feature-list i { color: var(--primary); }
  .link-btn { color: var(--primary); text-decoration: none; font-weight: 600; display: inline-flex; align-items: center; gap: 8px; font-size: 14px; }
  .link-btn:hover { gap: 12px; }

  /* Stack grid */
  .stack-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(180px, 1fr)); gap: 15px; margin-top: 30px; }
  .stack-item { background: var(--bg-light); padding: 16px; border-radius: 10px; text-align: center; font-weight: 500; border: 1px solid var(--border-color); }

  /* CTA */
  .cta-section { background: linear-gradient(135deg, var(--dark), #1e3a8a); color: white; padding: 55px 40px; border-radius: 24px; text-align: center; margin: 70px 0; }
  .cta-section h2 { font-size: 30px; margin-bottom: 14px; }
  .cta-section p { color: #cbd5e1; margin-bottom: 26px; }

  /* Footer */
  footer { background: var(--dark); color: #94a3b8; padding: 55px 0 26px; margin-top: 50px; }
  .footer-grid { display: grid; grid-template-columns: 2fr repeat(3, 1fr); gap: 40px; margin-bottom: 36px; }
  .footer-col h4 { color: white; margin-bottom: 16px; }
  .footer-col ul { list-style: none; }
  .footer-col ul li { margin-bottom: 10px; }
  .footer-col ul a { color: #94a3b8; text-decoration: none; }
  .footer-col ul a:hover { color: white; }
  .footer-bottom { border-top: 1px solid #1e293b; padding-top: 20px; text-align: center; font-size: 14px; }

  @media (max-width: 768px) {
    .hero-grid { grid-template-columns: 1fr; padding: 30px 20px; }
    .footer-grid { grid-template-columns: 1fr 1fr; }
    .trust-grid { grid-template-columns: 1fr 1fr; }
    .nav-links { display: none; }
  }
</style><!-- Font Awesome Icons & Inter Font -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<style>
  :root {
    --primary: #2f6fed;
    --primary-dark: #1d4ed8;
    --primary-light: #eaf2ff;
    --primary-lighter: #cfe0ff;
    
    --text-dark: #1e293b;
    --text-muted: #64748b;
    --bg-light: #f8fafc;
    --card-bg: #ffffff;
    --border-color: #e5eaf1;
  }

  * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Inter', sans-serif; }
  body { color: var(--text-dark); background-color: #ffffff; line-height: 1.6; }
  .container { max-width: 1200px; margin: 0 auto; padding: 0 20px; }

  /* Navbar — STICKY */
  .navbar { position: sticky; top: 0; z-index: 100; background: #ffffff; display: flex; justify-content: space-between; align-items: center; padding: 16px 0; border-bottom: 1px solid var(--border-color); box-shadow: 0 1px 0 rgba(15,23,42,0.03); }
  .logo { display: flex; align-items: center; gap: 12px; text-decoration: none; }
  .logo-icon { width: 42px; height: 42px; border-radius: 12px; object-fit: cover; }
  .logo-text h3 { color: var(--text-dark); font-size: 18px; line-height: 1.2; }
  .logo-text span { font-size: 11px; color: var(--text-muted); }
  .nav-links { display: flex; gap: 26px; align-items: center; list-style: none; }
  .nav-links a { text-decoration: none; color: var(--text-dark); font-weight: 500; font-size: 15px; transition: .2s; }
  .nav-links a:hover, .nav-links a.active { color: var(--primary); }
  .nav-actions { display: flex; align-items: center; gap: 20px; }

  /* Buttons */
  .btn-primary { background: var(--primary); color: white; padding: 11px 22px; border-radius: 10px; text-decoration: none; font-weight: 600; font-size: 14px; transition: .2s; display: inline-flex; align-items: center; gap: 8px; border: none; cursor: pointer; }
  .btn-primary:hover { background: var(--primary-dark); box-shadow: 0 8px 20px rgba(47,111,237,.25); transform: translateY(-2px); }
  .btn-outline { background: #fff; color: var(--primary); border: 1px solid var(--primary-lighter); padding: 11px 22px; border-radius: 10px; text-decoration: none; font-weight: 600; font-size: 14px; display: inline-flex; align-items: center; gap: 8px; transition: .2s; }
  .btn-outline:hover { background: var(--primary-light); transform: translateY(-2px); }
  .btn-lg { padding: 15px 30px; font-size: 16px; }

  /* Badge */
  .badge { display: inline-flex; align-items: center; gap: 8px; background: var(--primary-light); color: var(--primary); font-weight: 600; font-size: 13px; letter-spacing: .3px; text-transform: uppercase; padding: 7px 16px; border-radius: 999px; margin-bottom: 18px; }
  .badge-dot { position: relative; display: inline-flex; width: 8px; height: 8px; }
  .badge-dot span { position: absolute; inset: 0; border-radius: 50%; background: var(--primary); }
  .badge-dot .ping { background: var(--primary); opacity: .6; animation: ping 1.5s cubic-bezier(0,0,.2,1) infinite; }
  @keyframes ping { 75%,100% { transform: scale(2.2); opacity: 0; } }

  /* Hero (About/Services-style, centered, soft panel) */
  .hero-section { text-align: center; max-width: 850px; margin: 40px auto; padding: 60px 30px; background: linear-gradient(180deg, var(--primary-light), #ffffff); border-radius: 24px; }
  .hero-title { font-size: 40px; font-weight: 700; margin-bottom: 18px; }
  .hero-desc { color: var(--text-muted); font-size: 17px; }

  /* Hero (Home-style, two column, soft panel) */
  .hero-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 50px; align-items: center; padding: 50px 40px; margin: 30px 0; background: linear-gradient(135deg, var(--primary-light), #ffffff); border-radius: 24px; }
  .hero-grid .hero-title { text-align: left; font-size: 44px; }
  .hero-grid .hero-desc { text-align: left; max-width: 480px; }
  .gradient-text { color: var(--primary); }
  .hero-btns { display: flex; gap: 14px; margin-top: 28px; flex-wrap: wrap; }
  .hero-note { margin-top: 18px; font-size: 14px; color: var(--text-muted); }

  /* Dashboard mock card */
  .dashboard-card { border: 1px solid var(--border-color); background: #fff; border-radius: 18px; padding: 24px; box-shadow: 0 12px 30px rgba(15,23,42,.08); }
  .dash-header { display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid var(--border-color); padding-bottom: 14px; margin-bottom: 14px; }
  .dash-title { font-size: 14px; font-weight: 600; }
  .dash-status { background: var(--primary-light); color: var(--primary); padding: 3px 10px; border-radius: 999px; font-size: 12px; font-weight: 600; }
  .dash-stats { display: grid; grid-template-columns: 1fr 1fr; gap: 12px; }
  .dash-stat { background: var(--bg-light); border: 1px solid var(--border-color); border-radius: 10px; padding: 12px; }
  .dash-stat p:first-child { font-size: 12px; color: var(--text-muted); }
  .dash-stat p:last-child { font-size: 17px; font-weight: 700; margin-top: 4px; color: var(--text-dark); }
  .dash-chart { margin-top: 14px; background: var(--bg-light); border: 1px solid var(--border-color); border-radius: 10px; padding: 12px; }
  .chart-bars { display: flex; align-items: flex-end; gap: 6px; height: 70px; }
  .chart-bar { flex: 1; border-radius: 4px 4px 0 0; background: linear-gradient(to top, var(--primary), var(--primary-lighter)); }
  .chart-label { margin-top: 8px; font-size: 12px; color: var(--text-muted); }

  /* Trust bar */
  .trust-bar { border-top: 1px solid var(--border-color); border-bottom: 1px solid var(--border-color); margin: 20px 0; }
  .trust-grid { display: grid; grid-template-columns: repeat(4, 1fr); }
  .trust-stat { text-align: center; padding: 30px 10px; border-right: 1px solid var(--border-color); }
  .trust-stat:last-child { border-right: none; }
  .trust-value { font-size: 28px; font-weight: 800; color: var(--primary); }
  .trust-label { font-size: 13px; color: var(--text-muted); margin-top: 4px; text-transform: uppercase; letter-spacing: .5px; }

  /* Section heading */
  .section { padding: 60px 0; }
  .section-head { text-align: center; max-width: 620px; margin: 0 auto 40px; }
  .section-head h2 { font-size: 30px; margin-top: 4px; }

  /* Stats grid */
  .stats-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 20px; margin: 40px 0; }
  .stat-card { background: var(--bg-light); padding: 28px; border-radius: 14px; border: 1px solid var(--border-color); text-align: center; }
  .stat-card h2 { font-size: 34px; color: var(--primary); }
  .stat-card p { color: var(--text-muted); font-size: 14px; }

  /* Cards grid (team / services / why-us) */
  .team-section { padding: 50px 0; }
  .cards-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 26px; margin-top: 40px; }
  .card { border: 1px solid var(--border-color); border-radius: 16px; padding: 30px; background: var(--card-bg); transition: .25s; }
  .card:hover { transform: translateY(-5px); box-shadow: 0 16px 32px rgba(47,111,237,.12); border-color: var(--primary-lighter); }
  .card-icon { width: 46px; height: 46px; background: var(--primary-light); color: var(--primary); border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 19px; margin-bottom: 18px; }
  .card h3 { font-size: 19px; margin-bottom: 10px; }
  .card p { color: var(--text-muted); font-size: 14.5px; margin-bottom: 18px; }
  .feature-list { list-style: none; margin-bottom: 20px; }
  .feature-list li { display: flex; align-items: center; gap: 10px; font-size: 14px; margin-bottom: 10px; }
  .feature-list i { color: var(--primary); }
  .link-btn { color: var(--primary); text-decoration: none; font-weight: 600; display: inline-flex; align-items: center; gap: 8px; font-size: 14px; }
  .link-btn:hover { gap: 12px; }

  /* Stack grid */
  .stack-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(180px, 1fr)); gap: 15px; margin-top: 30px; }
  .stack-item { background: var(--bg-light); padding: 16px; border-radius: 10px; text-align: center; font-weight: 500; border: 1px solid var(--border-color); }

  /* CTA */
  .cta-section { background: linear-gradient(135deg, var(--dark), #1e3a8a); color: white; padding: 55px 40px; border-radius: 24px; text-align: center; margin: 70px 0; }
  .cta-section h2 { font-size: 30px; margin-bottom: 14px; }
  .cta-section p { color: #cbd5e1; margin-bottom: 26px; }

  /* Footer */
  footer { background: var(--dark); color: #94a3b8; padding: 55px 0 26px; margin-top: 50px; }
  .footer-grid { display: grid; grid-template-columns: 2fr repeat(3, 1fr); gap: 40px; margin-bottom: 36px; }
  .footer-col h4 { color: white; margin-bottom: 16px; }
  .footer-col ul { list-style: none; }
  .footer-col ul li { margin-bottom: 10px; }
  .footer-col ul a { color: #94a3b8; text-decoration: none; }
  .footer-col ul a:hover { color: white; }
  .footer-bottom { border-top: 1px solid #1e293b; padding-top: 20px; text-align: center; font-size: 14px; }

  @media (max-width: 768px) {
    .hero-grid { grid-template-columns: 1fr; padding: 30px 20px; }
    .footer-grid { grid-template-columns: 1fr 1fr; }
    .trust-grid { grid-template-columns: 1fr 1fr; }
    .nav-links { display: none; }
  }
</style>