import { createWebHistory, createRouter } from "vue-router";

const routes = [
    {
        path: "/",
        component: () =>
            import('../components/HomePage.vue')
    },
    {
        path: "/grid-sample",
        component: () =>
            import('../components/GridSample.vue')
    },
];

// Vue 라우터 인스턴스 생성
const router = new createRouter({
    history: createWebHistory(),
    routes
});

export default router;
