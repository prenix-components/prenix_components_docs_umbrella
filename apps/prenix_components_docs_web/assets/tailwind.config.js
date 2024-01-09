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
    '../../prenix_components/config/config.exs',
  ],
  theme: {},
  plugins: [
    require('../../prenix_components/assets/plugin'),
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
      let iconsDir = path.join(
        __dirname,
        './node_modules/@material-design-icons/svg',
      )
      let values = {}
      let icons = [
        ['', '/round'],
        ['filled-', '/filled'],
        ['outlined-', '/outlined'],
        ['sharp-', '/sharp'],
      ]
      icons.forEach(([prefix, dir]) => {
        fs.readdirSync(path.join(iconsDir, dir)).map((file) => {
          let name = prefix + path.basename(file, '.svg').replace(/_/g, '-')
          values[name] = { name, fullPath: path.join(iconsDir, dir, file) }
        })
      })

      matchComponents(
        {
          mdi: ({ name, fullPath }) => {
            let content = fs
              .readFileSync(fullPath)
              .toString()
              .replace(/\r?\n|\r/g, '')
              .replace(/width="[^\"]*"/, '')
              .replace(/height="[^\"]*"/, '')

            return {
              [`--mdi-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
              '-webkit-mask': `var(--mdi-${name})`,
              mask: `var(--mdi-${name})`,
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

    // plugin(function ({ matchComponents, theme }) {
    //   let iconsDir = path.join(__dirname, './node_modules/ionicons/dist/svg')
    //   let values = {}

    //   fs.readdirSync(path.join(iconsDir)).forEach((file) => {
    //     let name = path.basename(file, '.svg')
    //     values[name] = { name, fullPath: path.join(iconsDir, file) }
    //   })

    //   matchComponents(
    //     {
    //       ion: ({ name, fullPath }) => {
    //         let content = fs
    //           .readFileSync(fullPath)
    //           .toString()
    //           .replace(/\r?\n|\r/g, '')

    //         return {
    //           [`--ion-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
    //           '-webkit-mask': `var(--ion-${name})`,
    //           mask: `var(--ion-${name})`,
    //           'mask-repeat': 'no-repeat',
    //           'background-color': 'currentColor',
    //           'vertical-align': 'middle',
    //           display: 'inline-block',
    //           width: theme('spacing.5'),
    //           height: theme('spacing.5'),
    //         }
    //       },
    //     },
    //     { values },
    //   )
    // }),
  ],
}
