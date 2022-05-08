import { createApp } from 'vue'
import App from './App.vue'
import router from "./router/index.js"

import VueSidebarMenu from 'vue-sidebar-menu'
import 'vue-sidebar-menu/dist/vue-sidebar-menu.css'

import axios from "axios";

import "bootstrap/dist/css/bootstrap.min.css"
import "bootstrap/dist/js/bootstrap.js"
import "@fortawesome/fontawesome-free/css/all.css"

axios.defaults.baseURL = 'http://localhost:8080'

const app = createApp(App)
app.use(router)
app.use(VueSidebarMenu)
app.config.globalProperties.axios = axios;
app.mount('#app')
