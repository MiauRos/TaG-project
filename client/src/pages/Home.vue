<template>
  <v-container>
    <v-row>
      <v-col v-for="product in products" :key="product.id" cols="12" md="4">
        <v-card>
          <v-img :src="product.imageUrl" height="200px"></v-img>
          <v-card-title>{{ product.name }}</v-card-title>
          <v-card-text>${{ product.price }}</v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import api from '../services/api';

const products = ref([]);

onMounted(async () => {
  const res = await api.get('/products');
  products.value = res.data;
});
</script>
