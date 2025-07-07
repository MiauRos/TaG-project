<template>
  <v-app-bar app color="primary" dark>
    <v-toolbar-title class="pa-0">
      <RouterLink
        to="/"
        class="d-flex align-center text-white text-decoration-none"
        style="gap: 8px"
      >
        <v-img
          :src="logo"
          alt="Logo"
          height="32"
          max-width="32"
          contain
          class="align-self-center"
        />
        <span class="text-h6">Tech and Gadgets</span>
      </RouterLink>
    </v-toolbar-title>

    <v-spacer />

    <v-btn text to="/" prepend-icon="mdi-home">Inicio</v-btn>
    <v-btn text to="/products" prepend-icon="mdi-tag-multiple">Productos</v-btn>
    <v-btn text to="/cart" prepend-icon="mdi-cart">Carrito</v-btn>
    <v-btn text to="/orders" prepend-icon="mdi-clipboard-list-outline" v-if="isLoggedIn">
      Mis Pedidos
    </v-btn>

    <v-btn text to="/login" prepend-icon="mdi-login" v-if="!isLoggedIn">
      Iniciar sesión
    </v-btn>

    <v-menu v-else>
      <template #activator="{ props }">
        <v-btn text v-bind="props" prepend-icon="mdi-account-circle">
          {{ userStore.user?.first_name || 'Mi Cuenta' }}
        </v-btn>
      </template>

      <v-list>
        <v-list-item @click="logout">
          <v-list-item-title>
            <v-icon start icon="mdi-logout" class="mr-1" /> Cerrar sesión
          </v-list-item-title>
        </v-list-item>
      </v-list>
    </v-menu>
  </v-app-bar>
</template>

<script setup>
import { useUserStore } from '@/stores/user';
import { useRouter } from 'vue-router';
import { computed } from 'vue';
import logo from '../../assets/TaG_logo_icon.png'

const router = useRouter();
const userStore = useUserStore();

const isLoggedIn = computed(() => userStore.isLoggedIn);

const logout = () => {
  userStore.logout();
  router.push('/login');
};
</script>
