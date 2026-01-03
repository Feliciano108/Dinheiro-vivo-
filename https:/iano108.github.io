Toque Rápido Angola – Versão Avançada

> Nota importante (legal e ética): Este jogo usa moedas virtuais. Não promete nem paga dinheiro real. A monetização é feita por anúncios, parcerias e compras opcionais dentro do jogo.




---

📄 index.html (cole este código inteiro no arquivo)

<!DOCTYPE html>
<html lang="pt">
<head>
  <meta charset="UTF-8" />
  <title>Toque Rápido Angola</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <style>
    :root{
      --bg1:#6a11cb; --bg2:#2575fc; --accent:#00ffd5; --danger:#ff5252;
    }
    *{box-sizing:border-box}
    body{
      margin:0; min-height:100vh; font-family:system-ui,-apple-system,Segoe UI,Roboto,Arial;
      background:linear-gradient(135deg,var(--bg1),var(--bg2)); color:#fff; text-align:center;
    }
    header{padding:14px 10px}
    h1{margin:6px 0 4px}
    .sub{opacity:.9; font-size:14px}
    .wrap{max-width:420px; margin:0 auto; padding:10px}
    .card{background:rgba(0,0,0,.25); border-radius:18px; padding:12px; box-shadow:0 10px 30px rgba(0,0,0,.25)}
    #hud{display:flex; justify-content:space-between; gap:8px; margin-bottom:8px}
    .pill{background:rgba(255,255,255,.18); border-radius:999px; padding:6px 10px; font-size:13px}
    #arena{
      position:relative; margin:12px auto; width:320px; height:320px;
      background:radial-gradient(circle at 30% 30%, #1b1b1b, #000);
      border-radius:20px; overflow:hidden;
    }
    .target{
      position:absolute; width:64px; height:64px; border-radius:50%;
      background:radial-gradient(circle at 30% 30%, #fff, var(--accent));
      box-shadow:0 0 18px rgba(0,255,213,.9);
      animation:pulse .9s infinite;
    }
    .bad{
      background:radial-gradient(circle at 30% 30%, #fff, var(--danger));
      box-shadow:0 0 18px rgba(255,82,82,.9);
    }
    @keyframes pulse{0%{transform:scale(1)}50%{transform:scale(1.18)}100%{transform:scale(1)}}
    .controls{display:flex; gap:8px; justify-content:center; flex-wrap:wrap}
    button{
      border:0; border-radius:14px; padding:10px 14px; font-size:16px; color:#0b1a1a;
      background:linear-gradient(135deg,#00ffd5,#7cffcb); cursor:pointer; min-width:120px
    }
    button.secondary{background:linear-gradient(135deg,#ffd36a,#ff9f43)}
    button.ghost{background:rgba(255,255,255,.2); color:#fff}
    footer{opacity:.75; font-size:12px; margin:10px}
    .shake{animation:shake .3s}
    @keyframes shake{0%{transform:translateX(0)}25%{transform:translateX(-4px)}50%{transform:translateX(4px)}75%{transform:translateX(-4px)}100%{transform:translateX(0)}}
  </style>
</head>
<body>
  <header>
    <h1>🎮 Toque Rápido Angola</h1>
    <div class="sub">Velocidade • Foco • Recompensas Virtuais</div>
  </header>

  <div class="wrap">
    <div class="card">
      <div id="hud">
        <div class="pill">Nível: <b id="level">1</b></div>
        <div class="pill">Moedas: <b id="coins">0</b></div>
        <div class="pill">Tempo: <b id="time">30</b>s</div>
      </div>
      <div id="arena"></div>
      <div class="controls">
        <button onclick="start()">Começar</button>
        <button class="secondary" onclick="toggleSound()">Som</button>
        <button class="ghost" onclick="shop()">Loja</button>
      </div>
    </div>
  </div>

  <footer>
    Moedas são virtuais. Ganhos reais dependem de anúncios/parcerias.
  </footer>

<script>
  // ===== Estado =====
  let level=1, coins=0, timeLeft=30, timer=null, spawnMs=900;
  let soundOn=true; const arena=document.getElementById('arena');
  const elL=document.getElementById('level');
  const elC=document.getElementById('coins');
  const elT=document.getElementById('time');

  // ===== Áudio simples (Web Audio) =====
  const ctx = new (window.AudioContext||window.webkitAudioContext)();
  function beep(freq=600, dur=0.08){ if(!soundOn) return; const o=ctx.createOscillator(); const g=ctx.createGain(); o.connect(g); g.connect(ctx.destination); o.frequency.value=freq; o.start(); g.gain.exponentialRampToValueAtTime(0.0001, ctx.currentTime+dur); o.stop(ctx.currentTime+dur); }

  function start(){ reset(); tick(); spawn(); }
  function reset(){ level=1; coins=0; timeLeft=30; spawnMs=900; update(); clearInterval(timer); }
  function update(){ elL.textContent=level; elC.textContent=coins; elT.textContent=timeLeft; }

  function tick(){
    timer=setInterval(()=>{
      timeLeft--; update();
      if(timeLeft<=0){ nextLevel(); }
    },1000);
  }

  function nextLevel(){
    clearInterval(timer); level++; timeLeft=30;
    spawnMs=Math.max(350, spawnMs-120); // mais difícil
    arena.classList.add('shake'); setTimeout(()=>arena.classList.remove('shake'),300);
    update(); tick(); spawn();
  }

  function spawn(){
    arena.innerHTML='';
    const t=document.createElement('div');
    t.className='target';
    const isBad = Math.random()<0.25;
    if(isBad) t.classList.add('bad');
    const max=arena.clientWidth-64;
    t.style.left=Math.random()*max+'px';
    t.style.top=Math.random()*max+'px';
    t.onclick=()=>{
      if(isBad){ coins=Math.max(0, coins-2); beep(180,.12); }
      else{ coins+=1; beep(820,.06); }
      update(); spawn();
    };
    arena.appendChild(t);
    setTimeout(()=>{ if(arena.contains(t)) spawn(); }, spawnMs);
  }

  function toggleSound(){ soundOn=!soundOn; beep(400,.05); }
  function shop(){ alert('Loja: skins, remover anúncios, boosters (em breve)'); }
</script>
</body>
</html>


---

💰 Como ganhar dinheiro (forma correta)

1. Anúncios: Use redes como Google AdSense (web) ou AdMob (app). Coloque banners/intersticiais.


2. Compras no jogo: remover anúncios, skins, boosters.


3. Parcerias: links afiliados (ex.: operadoras, jogos parceiros).


4. Tráfego: redes sociais + WhatsApp + TikTok.



> Nunca prometa dinheiro real dentro do jogo. Seja transparente.
