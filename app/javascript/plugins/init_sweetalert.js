// Matt: add init_sweetalert

import swal from 'sweetalert';

const initSweetalert = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options).then(callback); // <-- add the `.then(callback)`
    });
  }
};

// base method with no callback action
// const initSweetalert = (selector, options = {}) => {
//   const swalButton = document.querySelector(selector);
//   if (swalButton) { // protect other pages
//     swalButton.addEventListener('click', () => {
//       swal(options);
//     });
//   }
// };



const sweetAlertEverywhere = () => {
  const allBtns = document.querySelectorAll('#sweet-alert-register')
  allBtns.forEach((btn) => {
    // initSweetalert(btn, {
    //   title: "Participation confirmée",
    //   text: "BA du jour accomplie !",
    //   icon: "success"
    // }, (value) => {
    //   const link = document.querySelector('#register-link');
    //   if (link) {link.click()};
    // });
    btn.addEventListener('click', (event) => {
      swal("Participation confirmée", "BA du jour accomplie !", "success");
      btn.style.backgroundColor = "#f8b400"
      btn.style.borderColor = "#f8b400"
      btn.innerText = "Déjà inscrit"
    })
  })
}




export { initSweetalert, sweetAlertEverywhere };
