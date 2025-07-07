<template>
  <v-app-bar app color="primary" dark>
    <v-toolbar-title>Tech and Gadgets</v-toolbar-title>
    <v-spacer />
    <v-btn text to="/">Inicio</v-btn>
    <v-btn text to="/products">Productos</v-btn>
    <v-btn text to="/cart">Carrito</v-btn>
    <v-btn text to="/orders" v-if="isLoggedIn">Mis Pedidos</v-btn>
    <v-btn text to="/login" v-if="!isLoggedIn">Login</v-btn>
    <v-btn text @click="logout" v-else>Logout</v-btn>
  </v-app-bar>
</template>

<script setup>
import { useUserStore } from '@/stores/user';
import { useRouter } from 'vue-router';
import { computed } from 'vue';

const router = useRouter();
const userStore = useUserStore();

const isLoggedIn = computed(() => userStore.isLoggedIn);

const logout = () => {
  userStore.logout()
  router.push('/login')
};
</script>

