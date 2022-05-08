<template>
    <sidebar-menu
        class="sidebar"
        :menu="menu"
        :collapsed="collapsed"
        @item-click="onItemClick"
        @collapse="onCollapse"
    >
    </sidebar-menu>
</template>

<script>
import { SidebarMenu } from 'vue-sidebar-menu'
import 'vue-sidebar-menu/dist/vue-sidebar-menu.css'

export default {
  name: 'MenuPanel',
  components: {
    SidebarMenu
  },
  data() {
    return {
      menu: [
        /*{
          href: '/',
          title: 'Home',
          icon: 'fa fa-home'
        },
        {
          href: '/grid-sample',
          title: 'Grid',
          icon: 'fa fa-list'
        },
        {
          href: "/user-mng",
          title: "User Management",
          icon: "fa fa-user"
        },*/
      ],
      collapsed: true
    }
  },
  created() {
    this.dataLoad();
  },
  methods: {
    dataLoad() {
      this.axios.get('/sample/menu/list').then((response) => {
        console.log(response.data);
        this.menu = [];
        if(response.data != null) {
          response.data.forEach(item =>{
            let menu = {
              href: item.page_url,
              title: item.menu_name,
              icon: item.icon
            };
            this.menu.push(menu);
          });
        }
      })
    },

    onItemClick() {
      console.log("onItemClick");
    },
    onCollapse(c) {
      console.log("onCollapse");
      this.collapsed = c;
    },
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

.fade-animation-enter-active {
  transition: transform 0.15s, opacity 0.45s !important;
}
.fade-animation-enter,
.fade-animation-leave-to {
  transform: translateX(-60%) !important;
  opacity: 0 !important;
}
</style>
