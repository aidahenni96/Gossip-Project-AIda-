module.exports = {
  entry: {
    application: './app/javascript/packs/application.js',
  },
  // ... le reste
};
const { environment } = require('@rails/webpacker')

// Ajoute cette ligne pour fixer l'avertissement :
environment.config.merge({ mode: 'development' })

module.exports = environment
