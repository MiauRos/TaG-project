<template>
  <v-container class="pa-4" fluid>
    <h2 class="text-2xl font-bold mb-4">Selecciona tus productos</h2>

    <!-- Pestañas para categorías -->
    <v-tabs v-model="activeTab">
      <v-tab v-for="(items, category) in groupedProducts" :key="category" color="primary">
        {{ category }}
      </v-tab>
    </v-tabs>

    <v-tabs-window v-model="activeTab" class="pt-2">
      <v-tabs-window-item v-for="(items, category) in groupedProducts" :key="category">
        <v-row>
          <v-col
            v-for="product in items"
            :key="product.product_id"
            cols="12"
            sm="6"
            md="4"
          >
            <v-card :elevation="2" class="mb-4">
              <v-card-title>{{ product.name }}</v-card-title>
              <v-card-subtitle>${{ product.price.toFixed(2) }}</v-card-subtitle>
              <v-card-actions>
                <v-btn
                  :disabled="!product.is_active"
                  @click="handleView(product)"
                  color="primary"
                >
                  Ver detalles
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-col>
        </v-row>
      </v-tabs-window-item>
    </v-tabs-window>

    <v-dialog v-model="productDialog" width="800" height="600">
      <product-dialog
        :product="selectedProduct"
        @close="productDialog = false"
      />
    </v-dialog>
  </v-container>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue';
import axios from 'axios';
import ProductDialog from '@/components/ProductDialog.vue'

const products = ref([]);
const activeTab = ref(0);
const productDialog = ref(false);
const selectedProduct = ref({});

const fetchProducts = async () => {
  const response = await axios.get('http://localhost:3000/api/products');
  products.value = response.data;
};

onMounted(fetchProducts);

const groupedProducts = computed(() => {
  const groups = {};
  products.value.forEach((product) => {
    const category = product.category?.name || 'Sin categoría';
    if (!groups[category]) groups[category] = [];
    groups[category].push(product);
  });
  return groups;
});

const handleView = (product) => {
  selectedProduct.value = product;
  productDialog.value = true;
};
</script>
