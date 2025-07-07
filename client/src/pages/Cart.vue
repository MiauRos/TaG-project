<template>
  <v-container fluid class="pa-5">
    <template v-if="!user">
      <v-alert type="warning" color="orange" border="start" variant="outlined" class="mt-6">
        Debes iniciar sesión para ver tu carrito de compras.
      </v-alert>
    </template>

    <template v-else>
      <h1 class="text-h5 mb-4">Carrito de compras</h1>

      <v-row dense>
        <v-col cols="12" md="6" lg="4" v-for="item in cartItems" :key="item.product_id">
          <v-card class="mb-4">
            <v-card-title class="d-flex justify-space-between align-center">
              {{ item.product.name }}
              <v-chip color="primary" text-color="white">${{ item.product.price.toFixed(2) }}</v-chip>
            </v-card-title>
            <v-card-text>
              <v-img :src="item.product.image_url" height="150" contain class="mb-3" />
              <div><strong>Cantidad:</strong> {{ item.quantity }}</div>
              <div><strong>Total:</strong> ${{ item.total_price.toFixed(2) }}</div>
              <div><strong>Descripción:</strong> {{ item.product.description }}</div>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>

      <div class="text-right mt-4">
        <h3>Total: ${{ total.toFixed(2) }}</h3>
      </div>
    </template>
  </v-container>
</template>

<script setup>
import axios from 'axios';
import { ref, computed, onBeforeMount } from 'vue'

const cartItems = ref([]);
const user = JSON.parse(localStorage.getItem('user'));

const total = computed(() =>
  cartItems.value.reduce((sum, item) => sum + item.total_price, 0)
);

onBeforeMount(async () => {
  if (!user) return;

  try {
    const { data: activeCart } = await axios.get(`http://localhost:3000/api/cart/user/${user.id}`);
    const { data: details } = await axios.get(`http://localhost:3000/api/cart-details/${activeCart[0].cart_id}`);
    cartItems.value = details;
  } catch (err) {
    console.error('Error cargando el carrito:', err);
  }
});
</script>
