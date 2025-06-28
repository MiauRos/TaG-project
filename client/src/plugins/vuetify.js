import 'vuetify/styles';
import { createVuetify } from 'vuetify';
import * as components from 'vuetify/components';
import * as directives from 'vuetify/directives';
import { aliases, mdi } from 'vuetify/iconsets/mdi';

const customTheme = {
  dark: false,
  colors: {
    primary: '#43A047',
    secondary: '#1B5E20',
    accent: '#A5D6A7',
    success: '#66BB6A',
    error: '#EF5350',
    warning: '#FFA726',
    info: '#26C6DA',
    background: '#F5F5F5',
  },
};

export default createVuetify({
  components,
  directives,
  theme: {
    defaultTheme: 'customTheme',
    themes: {
      customTheme,
    },
  },
  icons: {
    defaultSet: 'mdi',
    aliases,
    sets: {
      mdi,
    },
  },
});
