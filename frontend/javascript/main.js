document.addEventListener('DOMContentLoaded', async () => {
  try {
    // Replace with your actual Function App URL
    const functionUrl = 'https://vithu-function-app-new01.azurewebsites.net/api/GetResumeCounter?';
    const res = await fetch(functionUrl);
    const data = await res.json();
    document.getElementById('visitCount').innerText = data.count;
  } catch (err) {
    console.error('Error fetching visit count:', err);
    document.getElementById('visitCount').innerText = 'Unavailable';
  }
});
