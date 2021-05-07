export const properties = {
    back: {
        ip: 'localhost',
        port: 3000,
        getUrl: () => `http://${properties.back.ip}:${properties.back.port}`,
    },
};
