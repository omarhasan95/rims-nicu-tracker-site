(async function () {
  const files = [
    'app.part1.js',
    'app.part2.js',
    'app.part3.js',
    'app.part4.js'
  ];

  try {
    const source = (await Promise.all(
      files.map(async (file) => {
        const response = await fetch(file);
        if (!response.ok) throw new Error('Could not load ' + file);
        return response.text();
      })
    )).join('');

    const script = document.createElement('script');
    script.textContent = source;
    document.body.appendChild(script);
  } catch (error) {
    const app = document.getElementById('app');
    if (app) {
      app.innerHTML = '<div style="padding:24px;font-family:Inter,system-ui,sans-serif;color:#163246">Could not load the dashboard app. ' + error.message + '</div>';
    }
  }
})();
