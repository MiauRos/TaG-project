import { createRouter, createWebHistory } from 'vue-router';
import Home from '../pages/Home.vue';
import Login from '../pages/Login.vue'
import Products from '../pages/Products.vue'
import Register from '../pages/Register.vue'
import Cart from '../pages/Cart.vue'
import Checkout from '../pages/Checkout.vue'
import Orders from '../pages/Orders.vue'

const routes = [
  { path: '/', component: Home },
  { path: '/login', name: 'Login', component: Login },
  { path: '/products', name: 'Products', component: Products },
  { path: '/register', name: 'Register', component: Register },
  { path: '/cart', name: 'Cart', component: Cart },
  { path: '/checkout', name: 'Checkout', component: Checkout },
  { path: '/orders', name: 'Orders', component: Orders },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
