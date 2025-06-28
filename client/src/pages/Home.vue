<template>
  <v-container fluid class="pa-5">
    <v-row justify="center" class="mb-12">
      <v-col cols="12" md="8" class="text-center">
        <h1 class="text-h3 font-weight-bold mb-4 text-primary">
          ¡Bienvenido!
        </h1>
        <v-img
          :src="logo"
          class="mx-auto mb-6"
          alt="Logo de Tech and Gadgets"
        />
        <p class="text-subtitle-1 mb-6">
          Aquí encontrarás los mejores productos al mejor precio. 🌟
        </p>
        <v-btn color="primary" size="large" prepend-icon="mdi-cart">
          Ver productos
        </v-btn>
      </v-col>
    </v-row>
    <v-row>
      <v-col v-for="product in products" :key="product.id" cols="12" md="3">
        <v-card>
          <v-img :src="product.imageUrl" height="200px"/>
          <v-card-title>{{ product.name }}</v-card-title>
          <v-card-subtitle>${{ product.price }}</v-card-subtitle>
          <v-card-text>{{ product.description }}</v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import api from '../services/api';
import logo from '../assets/TaG_logo_name.png';

const products = ref([]);

onMounted(async () => {
  const res = await api.get('/products');
  products.value = res.data;
});
</script>
