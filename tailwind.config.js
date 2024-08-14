import defaultTheme from 'tailwindcss/defaultTheme';
import forms from '@tailwindcss/forms';

/** @type {import('tailwindcss').Config} */
export default {
    content: [
        './vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php',
        './storage/framework/views/*.php',
        './resources/views/**/*.blade.php',
        './resources/js/**/*.jsx',
    ],

    theme: {
        extend: {
            fontFamily: {
                sans: ['Figtree', ...defaultTheme.fontFamily.sans],
            },
            colors: {
                'light': '#00CCFF',
                'darker': '#000066',
                'primary': "#1B1B1F",
                'accent': "#4CAF50",
                'secondAccnt': '#FF5722',
                'text': "#E0E0E0",
                'muted': "#757575",
                'lines': '#282A36'
            },
            maxHeight: {
                '128': '38rem',
            },
            height: {
                '128': '42rem',
            }
        },
    },

    plugins: [forms],
};
