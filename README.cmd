<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Inicia — Emprendimiento (Demo Premium)</title>
  <style>
    :root{
      --lila-1: #a78bfa; /* principal */
      --lila-2: #c4b5fd; /* claro */
      --bg: #f8f6ff;
      --text: #1f2937;
      --card: #ffffff;
      --muted: #6b7280;
      --accent: var(--lila-1);
      --radius: 12px;
      --shadow: 0 6px 18px rgba(99,102,241,0.12);
      font-family: Inter, system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
    }
    *{box-sizing:border-box}
    body{margin:0; background: linear-gradient(180deg,var(--bg), #fff); color:var(--text); -webkit-font-smoothing:antialiased; -moz-osx-font-smoothing:grayscale; padding:24px;}

    .container{max-width:1100px; margin:0 auto;}
    header{display:flex; align-items:center; justify-content:space-between; gap:12px; margin-bottom:22px;}
    .brand{display:flex; gap:12px; align-items:center;}
    .logo{width:64px; height:64px; border-radius:12px; background:linear-gradient(135deg,var(--lila-1),var(--lila-2)); display:flex; align-items:center; justify-content:center; color:white; font-weight:700; box-shadow:var(--shadow); overflow:hidden;}
    .logo img{width:100%; height:100%; object-fit:cover; display:block;}
    .site-title{line-height:1;}
    .site-title h1{font-size:18px; margin:0;}
    .site-title p{margin:0; color:var(--muted); font-size:13px}

    .tabs{display:flex; gap:8px; align-items:center;}
    .tab{background:transparent; border:2px solid transparent; padding:8px 14px; border-radius:10px; cursor:pointer; font-weight:600;}
    .tab.active{background:linear-gradient(90deg,var(--lila-2),#ede9fe); border-color:var(--lila-1); box-shadow:var(--shadow);}

    main{display:grid; grid-template-columns: 1fr 340px; gap:20px; align-items:start;}
    .card{background:var(--card); border-radius:var(--radius); padding:18px; box-shadow:var(--shadow);}

    .hero{display:flex; gap:18px; align-items:center; margin-bottom:14px;}
    .hero .left{flex:1;}
    .hero h2{margin:0 0 8px 0; font-size:22px;}
    .hero p{margin:0; color:var(--muted);}

    .cta{margin-top:12px; display:flex; gap:8px;}
    .btn{padding:10px 14px; border-radius:10px; background:var(--accent); color:white; border:none; cursor:pointer; font-weight:700; box-shadow:0 6px 12px rgba(167,139,250,0.18);}
    .btn.secondary{background:transparent; color:var(--text); border:1px solid #e8e6ff; box-shadow:none; font-weight:600;}
    .btn.small{padding:6px 10px; font-size:13px; border-radius:8px;}
    .btn.ghost{background:transparent; color:var(--accent); border:1px dashed #e9e6ff; box-shadow:none;}

    /* Premium badge */
    .badge-premium{
      display:inline-block;
      background: linear-gradient(90deg,#ffd57a,#ffb86b);
      color:#4b2f00;
      padding:4px 8px;
      border-radius:999px;
      font-weight:700;
      font-size:12px;
      margin-left:8px;
    }

    /* Foros layout */
    #foros-section .new-thread{display:flex; gap:8px; margin-bottom:12px; flex-direction:column;}
    #foros-section input[type="text"], #foros-section textarea{width:100%; padding:10px 12px; border-radius:8px; border:1px solid #e6e6f2; font-size:14px;}
    #threads{display:flex; flex-direction:column; gap:10px;}
    .thread{border-radius:10px; padding:12px; background:linear-gradient(180deg,#fff, #faf8ff); border:1px solid #f0eefb;}
    .thread .meta{color:var(--muted); font-size:13px; margin-bottom:6px;}
    .thread h3{margin:0 0 6px 0; font-size:16px;}
    .thread p{margin:0 0 8px 0; color:#334155}
    .thread .show-btn{background:transparent; color:var(--accent); border:none; cursor:pointer; font-weight:700;}

    .sidebar .item{margin-bottom:12px}
    .stats{display:flex; gap:10px; flex-wrap:wrap;}
    .stat{flex:1 1 120px; background:linear-gradient(180deg,#fff,#fbf8ff); padding:10px; border-radius:10px; text-align:center; border:1px solid #f0eefb;}
    .small{font-size:13px; color:var(--muted)}

    .modal{position:fixed; inset:0; display:none; align-items:center; justify-content:center; background:rgba(15,15,25,0.45); padding:20px;}
    .modal.open{display:flex}
    .modal .modal-card{width:100%; max-width:760px; max-height:90vh; overflow:auto; background:var(--card); padding:18px; border-radius:12px;}
    .comments{margin-top:12px; display:flex; flex-direction:column; gap:10px;}
    .comment{padding:10px; border-radius:8px; border:1px solid #f1effb; background:#fff;}

    /* Premium-only visual */
    .premium-only{
      border-left:4px solid #ffd57a;
      padding-left:10px;
      background:linear-gradient(180deg,#fffef8,#fffdf6);
      border-radius:8px;
    }
    .locked{
      opacity:0.6;
      filter:grayscale(0.2);
      pointer-events:none;
    }   
    @media (max-width:940px){ main{grid-template-columns:1fr} .logo{width:56px;height:56px} }

    /* POPUP */
    /* POPUP */
    #popup {
      position: fixed;
      inset: 0;
      background: rgba(0,0,0,0.55);
      display: none;
      justify-content: center;
      align-items: center;
      padding: 20px;
      z-index: 9999;
    }

    #popup .popup-card {
      background: white;
      padding: 30px;
      border-radius: 16px;
      width: 420px;       /* TAMAÑO RECTANGULAR */
      max-width: 90%;
      box-shadow: 0 4px 15px rgba(0,0,0,0.3);
      text-align: center;
      animation: pop 0.25s ease;
    }

    @keyframes pop {
      from { transform: scale(0.6); opacity: 0; }
      to   { transform: scale(1); opacity: 1; }
    }

    #popup button{
      margin-top: 18px;
      background: var(--accent);
      padding: 12px 16px;
      border: none;
      border-radius: 10px;
      color: white;
      width: 100%;
      font-weight: 700;
      cursor: pointer;
    }

    #popup a{
      display: block;
      margin-top: 10px;
      color: #4a1eb8;
      font-weight: 700;
      text-decoration: none;
    }
  </style>
</head>

<body>

  <!-- POPUP -->
  <div id="popup">
    <div class="popup-card">

      <h3>¡Bienvenido a Inicia!</h3>
      <p>Esta página es una presentación de la app mostrando sus funciones principales.</p>

      <a href="https://drive.google.com/drive/folders/1srht2p85mdBJXTpn5ZgYmk6Y0CiH6N9M" target="_blank">
        Abrir carpeta en Drive
      </a>

      <button onclick="closePopup()">Cerrar</button>
    </div>
  </div>

  <div class="container">

    <header>
      <div class="brand">
        <div class="logo" title="Tu logo">
          <img src="logo.png" alt="logo emprender" width="200" onerror="this.style.display='none'; this.parentNode.textContent='IN'">
        </div>
        <div class="site-title">
          <h1>Inicia — Emprendimiento</h1>
          <p>G.IA</p>
        </div>
      </div>

      <nav style="display:flex; align-items:center; gap:12px;">
        <div class="tabs" aria-label="Navegación principal">
          <button class="tab active" data-tab="home">Inicio</button>
          <button class="tab" data-tab="foros">Foros</button>
          <button class="tab" data-tab="about">Sobre</button>
          <button class="tab" data-tab="novedades">Novedades</button>
        </div>

        <!-- Botón premium -->
        <div style="display:flex; align-items:center; gap:8px; margin-left:12px;">
          <button id="premium-btn" class="btn small" title="Versión Premium">Versión Premium</button>
          <span id="premium-indicator" style="display:none" class="badge-premium">PREMIUM</span>
        </div>
      </nav>
    </header>

    <main>
      <section id="content" class="card">
        <!-- HOME -->
        <div id="home-section" class="section" style="display:block">
          <div class="hero">
            <div class="left">
              <h2>Bienvenido a Inicia <span id="home-prem-badge" style="display:none" class="badge-premium">PREMIUM</span></h2>
              <p>Emprender nunca fue tan fácil. Nuestra aplicación te acompaña en cada paso para que tu idea se convierta en un negocio exitoso.</p>
              <div class="cta">
                <button class="btn" onclick="openTab('foros')">Ver Foros</button>

                <button id="crear-proyecto-btn" class="btn secondary" onclick="crearProyecto()" title="Crear proyecto">
                  Crear proyecto
               </button>

              </div>
            </div>
            <div class="right" style="width:220px;">
              <div style="background:linear-gradient(180deg,#fff, #f6f5ff); padding:12px; border-radius:12px; text-align:center;">
                <strong>Destacado</strong>
                <p class="small" style="margin-top:8px">Tutorial: Cómo validar tu idea en 30 días</p>
              </div>
            </div>
          </div>
         <img src="aaaa.webp" alt="logo negocio" width="650" height="300">
        </div>

        <!-- FOROS -->
        <div id="foros-section" class="section" style="display:none">
          <h2 style="margin-top:0">Foros</h2>
          <p class="small">Foro creado para emprendedores que buscan aprender, colaborar y apoyarse mutuamente. Aquí podrás debatir sobre negocios, compartir oportunidades y recibir retroalimentación de otros emprendedores.</p>
          <div class="new-thread">
            <input id="thread-title" type="text" placeholder="Título del hilo (p. ej. Cómo validar un MVP)" />
            <textarea id="thread-body" rows="3" placeholder="Describe tu pregunta o idea..."></textarea>
            <div style="display:flex; gap:8px; justify-content:flex-end;">
              <button class="btn" id="create-thread-btn">Crear hilo</button>
            </div>
            <img src="ia.jpg" alt="logo negocio" width="700" height="300">
          </div>
          <div id="threads" aria-live="polite"></div>
        </div>

        <!-- ABOUT -->
        <div id="about-section" class="section" style="display:none">
          <h2 style="margin-top:0">Sobre G.IA</h2>
          <p>Las iniciales de G.IA significan "Guía Inteligente para Emprender" y te enseñaremos paso a paso en tu negocio de una manera sencilla.</p>
           <img src="aaa.png" alt="logo negocio" width="700" height="350">
        </div>

        <!-- NOVEDADES -->
        <div id="novedades-section" class="section" style="display:none">
          <h2 style="margin-top:0">Novedades</h2>
          <p>Aquí aparecerán las últimas actualizaciones, noticias y funciones nuevas de la plataforma.</p>
          <ul>
            <li>Lanzamiento de la versión de foros 🎉</li>
            <li>Próximamente: sección de proyectos colaborativos (premium)</li>
            <li>Nuevos tutoriales de validación de ideas</li>
          </ul>
        </div>
      </section>

      <aside class="sidebar">
        <div class="card item">
          <h4 style="margin:0 0 8px 0">Estadísticas</h4>
          <div class="stats">
            <div class="stat">
              <div style="font-size:20px" id="stat-threads">0</div>
              <div class="small">Hilos</div>
            </div>
            <div class="stat">
              <div style="font-size:20px" id="stat-comments">0</div>
              <div class="small">Comentarios</div>
            </div>
            <div class="stat">
              <div style="font-size:20px" id="stat-users">—</div>
              <div class="small">Usuarios (demo)</div>
            </div>
          </div>
        </div>

        <div class="card item">
          <h4 style="margin:0 0 8px 0">Atajos</h4>
          <ul style="padding-left:18px; margin:0" class="small">
            <li onclick="openTab('foros')" style="cursor:pointer">Ir a Foros</li>
            <li onclick="openTab('home')" style="cursor:pointer">Volver a Inicio</li>
            <li style="cursor:pointer" onclick="openPremiumModal()">Ver Premium</li>
          </ul>
        </div>

        <div class="card item">
          <h4 style="margin:0 0 8px 0">Consejo</h4>
          <p class="small">Habla con posibles clientes, pregúntales si realmente usarían o comprarían lo que ofreces, y escucha sus opiniones.</p>
        </div>
      </aside>
    </main>

    <!-- Modal para ver hilo -->
    <div id="modal" class="modal" role="dialog" aria-hidden="true">
      <div class="modal-card">
        <button style="float:right" onclick="closeModal()">Cerrar ✕</button>
        <div id="modal-content"></div>
      </div>
    </div>

    <!-- Modal Premium -->
    <div id="premium-modal" class="modal" role="dialog" aria-hidden="true">
      <div class="modal-card">
        <button style="float:right" onclick="closePremiumModal()">Cerrar ✕</button>
        <h2>Versión Premium</h2>
        <p class="small">Desbloquea funciones exclusivas como proyectos colaborativos, plantillas premium y soporte prioritario.</p>

        <div style="display:flex; gap:12px; align-items:center; margin-top:12px;">
          <div style="flex:1; padding:12px; border-radius:8px; border:1px solid #f0eefb;">
            <h3>Plan Mensual</h3>
            <p class="small">S/ 9.99 / mes (demo)</p>
            <ul class="small">
              <li>Proyectos colaborativos</li>
              <li>Plantillas premium</li>
              <li>Soporte prioritario</li>
            </ul>
            <div style="margin-top:10px;">
              <button class="btn" onclick="purchasePremium()">Comprar (demo)</button>
              <button class="btn ghost" onclick="restorePurchase()">Restaurar compra</button>
            </div>
          </div>

          <div style="width:220px;">
            <h4>Demo</h4>
            <p class="small">Esta demo simula la compra guardando el estado en tu navegador. Para un pago real debes integrar una pasarela (Stripe, PayPal, etc.).</p>
            <button class="btn small" onclick="cancelPremium()">Cancelar Premium (demo)</button>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script>

  /* ----- Pestañas ----- */
  const tabs = document.querySelectorAll('.tab');
  function openTab(name){
    document.querySelectorAll('.section').forEach(s=>s.style.display='none');
    document.querySelectorAll('.tab').forEach(t=>t.classList.remove('active'));
    document.getElementById(`${name}-section`).style.display = 'block';
    document.querySelector(`.tab[data-tab="${name}"]`).classList.add('active');
  }
  tabs.forEach(t=>t.addEventListener('click', ()=>openTab(t.dataset.tab)));
  document.getElementById('premium-btn').addEventListener('click', openPremiumModal);

  /* ----- Datos foros ----- */
  const LS_KEY='inicia_forum_v2';
  function loadData(){return JSON.parse(localStorage.getItem(LS_KEY)||'{"threads":[]}');}
  function saveData(d){localStorage.setItem(LS_KEY,JSON.stringify(d));}
  function uid(){return 't_'+Math.random().toString(36).slice(2,9);}
  function formatDate(ts){return new Date(ts).toLocaleString();}
  function escapeHtml(s){ return String(s).replace(/[&<>]/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;'}[c])); }

  function renderThreads(){
    const data=loadData();
    const container=document.getElementById('threads');
    container.innerHTML='';
    data.threads.forEach(th=>{
      const div=document.createElement('div');
      div.className='thread';
      div.innerHTML=`
        <strong>${escapeHtml(th.title)}</strong>
        <p>${escapeHtml(th.body)}</p>
        <small>${formatDate(th.createdAt)}</small>
        <div class="actions" style="margin-top:8px;">
          <button class="btn small" onclick='openThread("${th.id}")'>Ver</button>
          <button class="btn small" onclick='editThread("${th.id}")'>Editar</button>
          <button class="btn small" onclick='deleteThread("${th.id}")'>Eliminar</button>
        </div>
      `;
      container.appendChild(div);
    });
    document.getElementById('stat-threads').textContent=data.threads.length;
    document.getElementById('stat-comments').textContent=data.threads.reduce((s,t)=>s+(t.comments?t.comments.length:0),0);
  }

  /* ✅ Crear nuevo hilo */
  document.getElementById('create-thread-btn').onclick=()=>{
    const title=document.getElementById('thread-title').value.trim();
    const body=document.getElementById('thread-body').value.trim();
    if(!title) return alert('Pon un título');
    const data=loadData();
    data.threads.push({id:uid(),title,body,createdAt:Date.now(),comments:[]});
    saveData(data);
    document.getElementById('thread-title').value='';
    document.getElementById('thread-body').value='';
    renderThreads();
  };

  /* ✅ Eliminar hilo */
  function deleteThread(id){
    if(!confirm('¿Seguro que deseas eliminar este hilo?')) return;
    const data = loadData();
    data.threads = data.threads.filter(th => th.id !== id);
    saveData(data);
    renderThreads();
  }

  /* 🛠️ Editar hilo (opcional) */
  function editThread(id){
    const data = loadData();
    const hilo = data.threads.find(th => th.id === id);
    if(!hilo) return alert('No encontrado');
    const nuevoTitulo = prompt('Nuevo título:', hilo.title);
    if(nuevoTitulo === null) return;
    const nuevoBody = prompt('Nuevo contenido:', hilo.body);
    if(nuevoBody === null) return;
    hilo.title = nuevoTitulo.trim();
    hilo.body = nuevoBody.trim();
    saveData(data);
    renderThreads();
  }

  /* ===== Premium visual (solo decorativo, sin bloqueo) ===== */
  const PREMIUM_KEY = 'inicia_premium_v1';
  function isPremium(){ return localStorage.getItem(PREMIUM_KEY) === '1'; }
  function setPremium(state){
    if(state) localStorage.setItem(PREMIUM_KEY,'1');
    else localStorage.removeItem(PREMIUM_KEY);
    applyPremiumUI();
  }

  function applyPremiumUI(){
    const premium = isPremium();
    document.getElementById('premium-indicator').style.display = premium ? 'inline-block' : 'none';
    document.getElementById('home-prem-badge').style.display = premium ? 'inline-block' : 'none';
    const crearBtn = document.getElementById('crear-proyecto-btn');
    crearBtn.classList.remove('locked');
    crearBtn.title = 'Crear proyecto';
  }

  /* Modal premium (solo decorativo) */
  function openPremiumModal(){ document.getElementById('premium-modal').classList.add('open'); }
  function closePremiumModal(){ document.getElementById('premium-modal').classList.remove('open'); }

  function purchasePremium(){
    if(confirm('Comprar Premium (demo) — confirmar?')){
      setPremium(true);
      alert('¡Compra simulada exitosa! Ahora tienes Premium.');
      closePremiumModal();
    }
  }
  function restorePurchase(){
    if(isPremium()) alert('Compra restaurada.');
    else alert('No hay una compra previa.');
  }
  function cancelPremium(){
    if(!isPremium()) return alert('No estás en Premium.');
    if(confirm('¿Deseas cancelar Premium?')){
      setPremium(false);
      alert('Premium cancelado.');
      closePremiumModal();
    }
  }

  /* ✅ Crear proyecto (ahora libre para todos) */
  function crearProyecto(){
    const nombre = prompt('Nombre del proyecto:');
    if(!nombre) return;
    alert('Proyecto "'+nombre+'" creado (demo).');
  }

  applyPremiumUI();

  /* cerrar modales al click fuera */
  document.querySelectorAll('.modal').forEach(mod=>{
    mod.addEventListener('click', (e)=>{ if(e.target === mod) mod.classList.remove('open'); });
  });

  /* Mostrar hilos al cargar */
  renderThreads();
 /* === POPUP === */
  window.onload = () => {
    const popup = document.getElementById("popup");

    // Solo se muestra la primera vez
    if (!localStorage.getItem("popupShown")) {
      popup.style.display = "flex";
      localStorage.setItem("popupShown", "1");
    }
  };

  function closePopup(){
    document.getElementById("popup").style.display = "none";
  }

/* ----- POPUP de bienvenida ----- */
window.addEventListener("load", () => {
  const popup = document.getElementById("popup");

  // Solo mostrar si no se mostró antes
  if (!localStorage.getItem("popup_shown")) {
    popup.style.display = "flex";
  }
});

function closePopup() {
  document.getElementById("popup").style.display = "none";
  localStorage.setItem("popup_shown", "1");
}

/* ----- POPUP SIEMPRE AL CARGAR ----- */
window.addEventListener("load", () => {
  document.getElementById("popup").style.display = "flex";
});

function closePopup() {
  document.getElementById("popup").style.display = "none";
}



</script>
</body>
</html>
