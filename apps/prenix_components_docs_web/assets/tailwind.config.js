// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

const plugin = require('tailwindcss/plugin')
const fs = require('fs')
const path = require('path')

module.exports = {
  content: [
    './js/**/*.js',
    '../lib/prenix_components_docs_web.ex',
    '../lib/prenix_components_docs_web/**/*.*ex',
    '../../prenix_components/lib/**/*.*ex',
    '../../prenix_components/assets/css/**/*.css',
    '../../prenix_components/assets/js/**/*.js',
    '../../prenix_components/vendors/**/*.js',
  ],
  theme: {
    extend: {
      colors: {
        default: 'hsl(var(--default) / <alpha-value>)',
        primary: 'hsl(var(--primary) / <alpha-value>)',
        secondary: 'hsl(var(--secondary) / <alpha-value>)',
        success: 'hsl(var(--success) / <alpha-value>)',
        warning: 'hsl(var(--warning) / <alpha-value>)',
        danger: 'hsl(var(--danger) / <alpha-value>)',
        'neutral1-foreground':
          'hsl(var(--neutral1-foreground) / <alpha-value>)',
        'neutral2-foreground':
          'hsl(var(--neutral2-foreground) / <alpha-value>)',
        'neutral3-foreground':
          'hsl(var(--neutral3-foreground) / <alpha-value>)',
      },
    },
  },
  corePlugins: {
    container: false,
  },
  plugins: [
    // Allows prefixing tailwind classes with LiveView classes to add rules
    // only when LiveView classes are applied, for example:
    //
    //     <div class="phx-click-loading:animate-ping">
    //
    plugin(({ addVariant }) =>
      addVariant('phx-no-feedback', [
        '.phx-no-feedback&',
        '.phx-no-feedback &',
      ]),
    ),
    plugin(({ addVariant }) =>
      addVariant('phx-click-loading', [
        '.phx-click-loading&',
        '.phx-click-loading &',
      ]),
    ),
    plugin(({ addVariant }) =>
      addVariant('phx-submit-loading', [
        '.phx-submit-loading&',
        '.phx-submit-loading &',
      ]),
    ),
    plugin(({ addVariant }) =>
      addVariant('phx-change-loading', [
        '.phx-change-loading&',
        '.phx-change-loading &',
      ]),
    ),

    plugin(function ({ matchComponents, theme }) {
      let iconsDir = path.join(__dirname, './node_modules/ionicons/dist/svg')
      let values = {}

      fs.readdirSync(path.join(iconsDir)).forEach((file) => {
        let name = path.basename(file, '.svg')
        values[name] = { name, fullPath: path.join(iconsDir, file) }
      })

      matchComponents(
        {
          ion: ({ name, fullPath }) => {
            let content = fs
              .readFileSync(fullPath)
              .toString()
              .replace(/\r?\n|\r/g, '')

            return {
              [`--ion-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
              '-webkit-mask': `var(--ion-${name})`,
              mask: `var(--ion-${name})`,
              'mask-repeat': 'no-repeat',
              'background-color': 'currentColor',
              'vertical-align': 'middle',
              display: 'inline-block',
              width: theme('spacing.5'),
              height: theme('spacing.5'),
            }
          },
        },
        { values },
      )
    }),
  ],
}
