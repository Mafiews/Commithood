// import { addMarkers } from '../plugins/init_mapbox';

// const initSearchbarIndex = (map) => {
//   const causes = document.querySelectorAll('#user_cause');

//   causes.forEach ((cause) => {
//     cause.addEventListener('click', (event)=> {
//       if (cause.value === "Tous les thèmes" && cause.checked === true) {
//         causes.forEach ((c) => {
//           c.checked = false
//         });
//         cause.checked = "checked"
//       } else {
//         causes[0].checked = false
//       }
//       cause.checked = "checked"
//       // cause.form.submit()
//       fetch('/events', { headers: { accept: "application/json" } })
//       .then(response => response.json())
//       .then((data) => {
//         const filterMarkers = [];
//         console.log(cause.checked)
//         // if (cause.checked === true) {

//         //   data.markers.forEach((marker)=>{
//         //     if (marker.title.includes(cause.value)) {
//         //       filterMarkers.push(marker);
//         //     }
//         //   })
//         // };
//         // console.log(filterMarkers)
//         console.log(map)
//         addMarkers(map[0], map[1])
//       });
//     });
//   });
// }



// export { initSearchbarIndex };
