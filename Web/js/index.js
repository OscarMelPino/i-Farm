import { Connection } from './conections.js';
import { properties } from './properties.js';

document.addEventListener('DOMContentLoaded', () => {
    const btnLogin = document.getElementById('btnLogin');
    btnLogin.onclick = () => {
        Connection.Get(
            `${properties.back.getUrl()}/login`,
            {
                user: document.getElementById('user').value,
                pass: document.getElementById('pass').value,
            },
            {
                success: async (response) => {
                    debugger;
                    const user = await response.json();
                    alert(`registrado usuario ${user.name} con id ${user.id}`);
                },
            }
        );
    };
});
