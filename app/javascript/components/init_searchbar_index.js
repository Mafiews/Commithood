const initSearchbarIndex = () => {
  const causes = document.querySelectorAll('#user_cause');
  causes.forEach ((cause) => {
    cause.addEventListener('click', (event)=> {
      console.log(cause)
      if (cause.value === "Tous les thèmes" && cause.checked === true) {
        causes.forEach ((c) => {
          c.checked = false
        });
        cause.checked = "checked"
      } else {
        causes[0].checked = false
      }
      cause.form.submit()
    });
  });
}

export { initSearchbarIndex };
