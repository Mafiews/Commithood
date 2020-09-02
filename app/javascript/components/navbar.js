const initUpdateNavbarOnScroll = () => {
  const navbar = document.getElementById('navbar-home');
  const logoGreen = document.getElementById ("logo-navbar-all")
  const logoWhite = document.getElementById ("logo-home")
  const navLink1 = document.getElementById ("nav-link-home1")
  const navLink2 = document.getElementById ("nav-link-home2")
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY <= 600) {
        navbar.style.backgroundColor = 'transparent';
        // navbar.classList.add('nav-link-home1');
        logoGreen.style.display = 'none'
        logoWhite.style.display = 'block'
        navLink1.style.color = 'white'
        navLink2.style.color = 'white'
      } else {
        logoGreen.style.display = "block"
        logoWhite.style.display = "none"
        navbar.style.backgroundColor = '#FCF9F1'
        navLink1.style.color = '#2c786c'
        navLink2.style.color = '#2c786c'
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
