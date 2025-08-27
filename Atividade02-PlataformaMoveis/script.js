
const btn = document.querySelector('[data-menu]');
const drawer = document.querySelector('.drawer');
const scrim = document.querySelector('.scrim');
btn?.addEventListener('click', () => {
  drawer.classList.toggle('open');
  scrim.classList.toggle('show');
});
scrim?.addEventListener('click', () => {
  drawer.classList.remove('open');
  scrim.classList.remove('show');
});


if ('serviceWorker' in navigator) {
  window.addEventListener('load', () => {
    navigator.serviceWorker.register('./service-worker.js');
  });
}
