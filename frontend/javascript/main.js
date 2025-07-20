document.addEventListener('DOMContentLoaded', async () => {
  try {
    const res = await fetch('https://vithu-function-app-new01.azurewebsites.net/api/GetResumeCounter?');
    const data = await res.json();
    document.getElementById('visitCount').innerText = data.count;
  } catch (err) {
    document.getElementById('visitCount').innerText = 'Unavailable';
  }
});
