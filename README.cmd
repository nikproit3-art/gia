<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Inicia — Emprendimiento</title>
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
    body{
      margin:0;
      background: linear-gradient(180deg,var(--bg), #fff);
      color:var(--text);
      -webkit-font-smoothing:antialiased;
      -moz-osx-font-smoothing:grayscale;
      padding:24px;
    }

    /* Contenedor */
    .container{
      max-width:1100px;
      margin:0 auto;
    }

    /* Header */
    header{
      display:flex;
      align-items:center;
      justify-content:space-between;
      gap:12px;
      margin-bottom:22px;
    }
    .brand{
      display:flex;
      gap:12px;
      align-items:center;
    }
    .logo{
      width:64px;
      height:64px;
      border-radius:12px;
      background:linear-gradient(135deg,var(--lila-1),var(--lila-2));
      display:flex;
      align-items:center;
      justify-content:center;
      color:white;
      font-weight:700;
      box-shadow:var(--shadow);
      overflow:hidden;
    }
    .logo img{width:100%; height:100%; object-fit:cover; display:block;}

    .site-title{
      line-height:1;
    }
    .site-title h1{
      font-size:18px;
      margin:0;
    }
    .site-title p{margin:0; color:var(--muted); font-size:13px}

    /* Nav tabs */
    .tabs{
      display:flex;
      gap:8px;
      align-items:center;
    }
    .tab{
      background:transparent;
      border:2px solid transparent;
      padding:8px 14px;
      border-radius:10px;
      cursor:pointer;
      font-weight:600;
    }
    .tab.active{
      background:linear-gradient(90deg,var(--lila-2),#ede9fe);
      border-color:var(--lila-1);
      box-shadow:var(--shadow);
    }

    main{
      display:grid;
      grid-template-columns: 1fr 340px;
      gap:20px;
      align-items:start;
    }

    /* Card */
    .card{
      background:var(--card);
      border-radius:var(--radius);
      padding:18px;
      box-shadow:var(--shadow);
    }

    /* Hero */
    .hero{
      display:flex;
      gap:18px;
      align-items:center;
      margin-bottom:14px;
    }
    .hero .left{
      flex:1;
    }
    .hero h2{
      margin:0 0 8px 0;
      font-size:22px;
    }
    .hero p{margin:0; color:var(--muted);}

    .cta{
      margin-top:12px;
      display:flex;
      gap:8px;
    }
    .btn{
      padding:10px 14px;
      border-radius:10px;
      background:var(--accent);
      color:white;
      border:none;
      cursor:pointer;
      font-weight:700;
      box-shadow:0 6px 12px rgba(167,139,250,0.18);
    }
    .btn.secondary{
      background:transparent;
      color:var(--text);
      border:1px solid #e8e6ff;
      box-shadow:none;
      font-weight:600;
    }

    /* Foros layout */
    #foros-section .new-thread{
      display:flex;
      gap:8px;
      margin-bottom:12px;
      flex-direction:column;
    }
    #foros-section input[type="text"],
    #foros-section textarea{
      width:100%;
      padding:10px 12px;
      border-radius:8px;
      border:1px solid #e6e6f2;
      font-size:14px;
    }
    #threads{
      display:flex;
      flex-direction:column;
      gap:10px;
    }
    .thread{
      border-radius:10px;
      padding:12px;
      background:linear-gradient(180deg,#fff, #faf8ff);
      border:1px solid #f0eefb;
    }
    .thread .meta{
      color:var(--muted);
      font-size:13px;
      margin-bottom:6px;
    }
    .thread h3{margin:0 0 6px 0; font-size:16px;}
    .thread p{margin:0 0 8px 0; color:#334155}

    .thread .show-btn{
      background:transparent;
      color:var(--accent);
      border:none;
      cursor:pointer;
      font-weight:700;
    }

    /* Sidebar */
    .sidebar .item{margin-bottom:12px}
    .stats{
      display:flex;
      gap:10px;
      flex-wrap:wrap;
    }
    .stat{
      flex:1 1 120px;
      background:linear-gradient(180deg,#fff,#fbf8ff);
      padding:10px;
      border-radius:10px;
      text-align:center;
      border:1px solid #f0eefb;
    }
    .small{font-size:13px; color:var(--muted)}

    /* Thread modal (simple) */
    .modal{
      position:fixed;
      inset:0;
      display:none;
      align-items:center;
      justify-content:center;
      background:rgba(15,15,25,0.45);
      padding:20px;
    }
    .modal.open{display:flex}
    .modal .modal-card{
      width:100%;
      max-width:760px;
      max-height:90vh;
      overflow:auto;
      background:var(--card);
      padding:18px;
      border-radius:12px;
    }
    .comments{margin-top:12px; display:flex; flex-direction:column; gap:10px;}
    .comment{
      padding:10px;
      border-radius:8px;
      border:1px solid #f1effb;
      background:#fff;
    }

    /* Responsive */
    @media (max-width:940px){
      main{grid-template-columns:1fr}
      .logo{width:56px;height:56px}
    }
  </style>
</head>
<body>
  <div class="container">
    <header>
      <div class="brand">
        <div class="logo" title="Tu logo">
          <!-- Reemplaza la imagen con tu logo: poner <img src="ruta/logo.png" alt="logo"> -->
          <!-- Si no pones logo, se mostrará "IN" como placeholder -->
          <img src="logo.png" alt="logo emprender" width="200">
        </div>
        <div class="site-title">
          <h1>Inicia — Emprendimiento</h1>
          <p>G.IA </p>
        </div>
      </div>

      <nav class="tabs" aria-label="Navegación principal">
        <button class="tab active" data-tab="home">Inicio</button>
        <button class="tab" data-tab="foros">Foros</button>
        <button class="tab" data-tab="about">Sobre</button>
        <button class="tab" data-tab="novedades">Novedades</button>
      </nav>
    </header>

    <main>
      <section id="content" class="card">
        <!-- HOME -->
        <div id="home-section" class="section" style="display:block">
          <div class="hero">
            <div class="left">
              <h2>Bienvenido a Inicia</h2>
              <p>Emprender nunca fue tan fácil. Nuestra aplicación te acompaña en cada paso para que tu idea se convierta en un negocio exitoso.</p>
              <div class="cta">
                <button class="btn" onclick="openTab('foros')">Ver Foros</button>
                <button class="btn secondary" onclick="alert('Función de crear proyecto próximamente')">Crear proyecto</button>
              </div>           
            </div>
            <div class="right" style="width:220px;">
              <div style="background:linear-gradient(180deg,#fff, #f6f5ff); padding:12px; border-radius:12px; text-align:center;">
                <strong>Destacado</strong>
                <p class="small" style="margin-top:8px">Tutorial: Cómo validar tu idea en 30 días</p>
              </div>
            </div>
          </div>

          <div class="card" style="margin-top:8px;">
            <div id="recent-threads" style="display:flex; gap:10px; flex-wrap:wrap;"></div>
            <img src="aaaa.webp" alt="logo negocio" width="650" height="300">
          </div>
        </div>

        <!-- FOROS -->
        <div id="foros-section" class="section" style="display:none">
          <h2 style="margin-top:0">Foros</h2>
          <p class="small">Foro creado para emprendedores que buscan aprender, colaborar y apoyarse mutuamente. Aquí podrás debatir sobre negocios, compartir oportunidades y recibir retroalimentación de otros emprendedores <p>
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
          <p>G.IA es tu socio digital para emprender.No es solo una guía, es un simulador inteligente que convierte tu idea en números, estrategias y resultados reales.</p>
          <h3>Objetivo Principal</h3>
          <p>Brindar a los emprendedores una herramienta digital innovadora que los guíe paso a paso en la creación, organización y proyección de su negocio.</p>
              <img src="aaa.png" alt="logo aaa" width="700" height="350">
        </div>

      </section>
      
      <!-- NOVEDADES -->
   <div id="novedades-section" class="section" style="display:none">
    <h2 style="margin-top:0">Novedades</h2>
    <p>Aquí aparecerán las últimas actualizaciones, noticias y funciones nuevas de la plataforma.</p>
 
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
          </ul>
        </div>

        <div class="card item">
          <h4 style="margin:0 0 8px 0">Consejo</h4>
          <p class="small">Habla con posibles clientes, pregúntales si realmente usarían o comprarían lo que ofreces, y escucha sus opiniones. Muchas veces creemos que tenemos una gran idea, pero la clave está en comprobar si resuelve un problema real y si las personas están dispuestas a pagar por ello.</p>
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
  </div>

  <script>
    /* ----- Manejo de pestañas ----- */
    const tabs = document.querySelectorAll('.tab');
    function openTab(name){
      document.querySelectorAll('.section').forEach(s=>s.style.display='none');
      document.querySelectorAll('.tab').forEach(t=>t.classList.remove('active'));
      if(name==='home') {
        document.getElementById('home-section').style.display = 'block';
        document.querySelector('.tab[data-tab="home"]').classList.add('active');
      } else if(name==='foros'){
        document.getElementById('foros-section').style.display = 'block';
        document.querySelector('.tab[data-tab="foros"]').classList.add('active');
      } else if(name==='about'){
        document.getElementById('about-section').style.display = 'block';
        document.querySelector('.tab[data-tab="about"]').classList.add('active');
      }
        else if(name==='novedades'){
        document.getElementById('novedades-section').style.display = 'block';
        document.querySelector('.tab[data-tab="novedades"]').classList.add('active');
      }
    }
    tabs.forEach(t=>t.addEventListener('click', ()=>openTab(t.dataset.tab)));

   const LS_KEY='inicia_forum_v2';
    function loadData(){return JSON.parse(localStorage.getItem(LS_KEY)||'{"threads":[]}');}
    function saveData(d){localStorage.setItem(LS_KEY,JSON.stringify(d));}
    function uid(){return 't_'+Math.random().toString(36).slice(2,9);}
    function formatDate(ts){return new Date(ts).toLocaleString();}
    function escapeHtml(s){return s.replace(/[&<>]/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;'}[c]));}

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
          <div class="actions">
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

    /* Editar/Eliminar hilo */
    function editThread(id){
      const data=loadData();
      const th=data.threads.find(t=>t.id===id);
      if(!th) return;
      const nuevoTitulo=prompt("Editar título:",th.title);
      if(nuevoTitulo===null) return;
      const nuevoBody=prompt("Editar contenido:",th.body);
      if(nuevoBody===null) return;
      th.title=nuevoTitulo; th.body=nuevoBody;
      saveData(data); renderThreads();
    }
    function deleteThread(id){
      if(!confirm("¿Eliminar este hilo?")) return;
      let data=loadData();
      data.threads=data.threads.filter(t=>t.id!==id);
      saveData(data); renderThreads();
    }

    /* Modal hilo */
    function openThread(id){
      const data=loadData();
      const th=data.threads.find(t=>t.id===id);
      if(!th) return;
      const modal=document.getElementById('modal');
      const c=document.getElementById('modal-content');
      c.innerHTML=`
        <h2>${escapeHtml(th.title)}</h2>
        <p>${escapeHtml(th.body)}</p>
        <div><small>${formatDate(th.createdAt)}</small></div>
        <h3>Comentarios</h3>
        <div id="comments">${th.comments.map(cm=>`
          <div class="comment">
            <small>${formatDate(cm.createdAt)}</small>
            <div>${escapeHtml(cm.text)}</div>
            <div class="actions">
              <button class="btn small" onclick='editComment("${id}","${cm.id}")'>Editar</button>
              <button class="btn small" onclick='deleteComment("${id}","${cm.id}")'>Eliminar</button>
            </div>
          </div>`).join('')}</div>
        <textarea id="comment-text" rows="2" style="width:100%;margin-top:6px"></textarea>
        <button class="btn primary" onclick='addComment("${id}")'>Comentar</button>
      `;
      modal.classList.add('open');
    }
    function closeModal(){document.getElementById('modal').classList.remove('open');}

    function addComment(threadId){
      const txt=document.getElementById('comment-text').value.trim();
      if(!txt) return alert("Escribe algo");
      const data=loadData();
      const th=data.threads.find(t=>t.id===threadId);
      th.comments.push({id:uid(),text:txt,createdAt:Date.now()});
      saveData(data); renderThreads(); openThread(threadId);
    }
    function editComment(threadId,commentId){
      const data=loadData();
      const th=data.threads.find(t=>t.id===threadId);
      const cm=th.comments.find(c=>c.id===commentId);
      const nuevo=prompt("Editar comentario:",cm.text);
      if(nuevo===null) return;
      cm.text=nuevo; saveData(data); renderThreads(); openThread(threadId);
    }
    function deleteComment(threadId,commentId){
      if(!confirm("¿Eliminar comentario?")) return;
      const data=loadData();
      const th=data.threads.find(t=>t.id===threadId);
      th.comments=th.comments.filter(c=>c.id!==commentId);
      saveData(data); renderThreads(); openThread(threadId);
    }

    renderThreads();
  </script>
</body>
</html>
