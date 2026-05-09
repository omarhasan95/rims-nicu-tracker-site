$p='C:\Users\omarh\OneDrive\Desktop\Documents\GitHub\rims-nicu-tracker-site\index.html'
$html=Get-Content -Raw -Path $p

$style=@'
<style id="goose-smooth-enhancements">
.smooth-clock{position:fixed;top:14px;right:16px;z-index:9999;padding:9px 14px;border-radius:999px;background:rgba(16,24,40,.82);backdrop-filter:blur(8px);color:#fff;font:700 13px/1 Inter,Segoe UI,Arial;box-shadow:0 10px 30px rgba(0,0,0,.25);letter-spacing:.2px}
.card,.panel,.stat-card,section{transition:transform .35s cubic-bezier(.2,.8,.2,1), box-shadow .35s ease, filter .35s ease}
.card:hover,.panel:hover,.stat-card:hover,section:hover{transform:translateY(-3px); box-shadow:0 14px 36px rgba(26,67,103,.16)}
canvas{transition:filter .35s ease, transform .35s ease}
canvas:hover{filter:saturate(1.08); transform:translateY(-1px)}
@keyframes softFloat{0%{transform:translateY(0)}50%{transform:translateY(-4px)}100%{transform:translateY(0)}}
.logo,.brand,.header-title{animation:softFloat 4.8s ease-in-out infinite}
</style>
'@

if($html -notmatch 'goose-smooth-enhancements'){
  $html=$html -replace '</head>', ($style + "`n</head>")
}

if($html -notmatch 'id="smoothClock"'){
  $html=[regex]::Replace($html,'<body[^>]*>','$0`n<div id="smoothClock" class="smooth-clock" aria-live="polite"></div>',1)
}

$script=@'
<script id="goose-smooth-script">
(function(){
  function two(n){ return String(n).padStart(2,'0'); }
  function fmt(d){ return two(d.getHours())+':'+two(d.getMinutes())+':'+two(d.getSeconds())+'.'+String(Math.floor(d.getMilliseconds()/10)).padStart(2,'0'); }
  function gooseSmoothClockTick(){ var el=document.getElementById('smoothClock'); if(el){ el.textContent=fmt(new Date()); } requestAnimationFrame(gooseSmoothClockTick); }
  requestAnimationFrame(gooseSmoothClockTick);

  document.addEventListener('DOMContentLoaded', function(){
    var nodes=document.querySelectorAll('.card,.panel,.stat-card,section,canvas');
    nodes.forEach(function(n,i){
      n.style.opacity='0';
      n.style.transform='translateY(8px)';
      setTimeout(function(){
        n.style.transition=(n.style.transition? n.style.transition+',' : '') + 'opacity .45s ease, transform .45s ease';
        n.style.opacity='1';
        n.style.transform='translateY(0)';
      }, 40 + i*18);
    });
  });
})();
</script>
'@

if($html -notmatch 'goose-smooth-script'){
  $html=$html -replace '</body>', ($script + "`n</body>")
}

Set-Content -Path $p -Value $html -Encoding UTF8
Write-Output 'patched'
