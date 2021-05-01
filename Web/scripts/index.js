// oscar :P
document.addEventListener("DOMContentLoaded", () => {
  const btnCookie = document.getElementById("divCookies");
  btnCookie.onclick = () => {
    /* Connection.Get(
            'http://192.168.1.154:3000/login',
            {
                user: document.getElementById('user').value,
                pass: document.getElementById('pass').value,
            },
            {
                success: async (response) => {
                    const user = await response.json();
                    alert(`registrado usuario ${user.name} con id ${user.id}`);
                },
            }
        ); */
    hideCookies();
  };
  const formLogin = document.getElementById("formLogin");
  console.log(formLogin);
  formLogin.onsubmit = (event) => {
    event.preventDefault();
    const user = document.getElementById("User").value;
    const pass = document.getElementById("Pass").value;
    console.log(`Usuario: ${user}`);
    console.log(`Contraseña: ${pass}`);
  };
});

function hideCookies() {
  divCookies.classList.toggle("ocultar");
  console.log("Adios cookies.");
}
