// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

const menu = document.getElementById('menu');

menu.addEventListener('click', () => {
  const menuContainer = document.querySelector('.menu-container');
  menuContainer.style.display === 'none' ? (menuContainer.style.display = 'block') : (menuContainer.style.display = 'none');
});
