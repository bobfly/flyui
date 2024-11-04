module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/components/**/*.html.erb',
    './app/components/**/*.rb',
    './app/content/**/*.html.*',
    './lib/markdown_rails/**/*.rb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './config/initializers/**/*.rb'
  ],
  plugins: [
    require('@tailwindcss/typography')({
      // Limit typography plugin to specific areas
      className: 'prose',
    }),
    require('@tailwindcss/forms')({
      strategy: 'class', // Only apply form styles when the `form` class is present
    }),
    require('tailwindcss-motion'),
    require('daisyui')
  ],
  daisyui: {
    themes: ['light', 'dark'],
  },
}
