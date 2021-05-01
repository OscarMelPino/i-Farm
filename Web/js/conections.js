const Connection = {};

Connection.Get = async (url, params, handlers, signal) => Connection.Generic(url, 'GET', params, handlers, signal);

Connection.Post = async (url, params, handlers, signal) => Connection.Generic(url, 'POST', params, handlers, signal);

Connection.Put = async (url, params, handlers, signal) => Connection.Generic(url, 'PUT', params, handlers, signal);

Connection.Delete = async (url, params, handlers, signal) => Connection.Generic(url, 'DELETE', params, handlers, signal);

Connection.Head = async (url, params, handlers, signal) => Connection.Generic(url, 'HEAD', params, handlers, signal);

Connection.Upload = async (url, file, handlers, signal) => Connection.Generic(url, 'POST', file, handlers, signal, true);

/**
 * Método que realiza una llamada a la URL recibida y con el método indicado.
 * Puede, además, recibir unos parámetros en forma de objeto, los cuales se pasarán a la llamada.
 */
Connection.Generic = async (url, method, params, handlers, signal, upload) => {
    const { uri, config } = Connection.Config(url, method, params, signal, upload);
    const response = await fetch(uri, config);
    response.ok ? handlers.success && (await handlers.success(response, uri, config)) : handlers.failure && (await handlers.failure(response, uri, config));
    handlers.callback && (await handlers.callback(response, uri, config));
    return response;
};

Connection.Config = (url, method, params, signal, upload) => {
    const config = {
        method: method,
        mode: 'cors',
    };
    if (signal) config.signal = signal;
    if (params) {
        if (method == 'GET' || method == 'HEAD') {
            url = Connection.Encode(`${url}?`, params);
        } else {
            if (!upload)
                config.headers = {
                    Accept: 'application/json',
                    'Content-Type': 'application/json',
                };
            config.body = upload ? params : JSON.stringify(params);
        }
    }
    return { uri: url, config: config };
};

Connection.Encode = (url, params) => {
    Object.keys(params).forEach((property, index) => {
        if (index > 0) {
            url += '&';
        }
        if (Array.isArray(params[property])) {
            params[property].forEach((element, index) => {
                url += `${index > 0 ? '&' : ''}${encodeURIComponent(property)}=${typeof element === 'object' ? encodeURIComponent(JSON.stringify(element)) : encodeURIComponent(element)}`;
            });
        } else if (typeof params[property] === 'object') {
            url += `${encodeURIComponent(property)}=${encodeURIComponent(JSON.stringify(params[property]))}`;
        } else {
            url += `${encodeURIComponent(property)}=${encodeURIComponent(params[property])}`;
        }
    });
    return url;
};
