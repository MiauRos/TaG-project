<template>
  <v-container class="pa-6" fluid>
    <h1 class="text-h5 font-weight-bold text-primary mb-6">
      <v-icon start>mdi-package-variant-closed</v-icon> Explora nuestros productos
    </h1>
    <p class="text-subtitle-1 mb-6">
      Encuentra tecnología de punta agrupada por categoría. ¡Haz clic para más detalles!
    </p>

    <!-- Pestañas de categorías -->
    <v-tabs
      v-model="activeTab"
      grow
      show-arrows
      class="mb-6"
      background-color="accent"
    >
      <v-tab
        v-for="(items, category, index) in groupedProducts"
        :key="category"
        :value="index"
        class="text-capitalize"
        color="primary"
      >
        {{ category }}
      </v-tab>
    </v-tabs>

    <v-tabs-window v-model="activeTab">
      <v-tabs-window-item
        v-for="(items, category, index) in groupedProducts"
        :key="category"
        :value="index"
      >
        <v-row>
          <v-col
            v-for="product in items"
            :key="product.product_id"
            cols="12"
            sm="6"
            md="4"
          >
            <v-card class="hover:scale-105 transition-all" elevation="3">
              <v-img
                :src="product.image_url || 'https://via.placeholder.com/300x200?text=Sin+imagen'"
                height="200px"
                contain
              />
              <v-card-title class="font-weight-medium">{{ product.name }}</v-card-title>
              <v-card-subtitle class="text-secondary mb-2">${{ product.price.toFixed(2) }}</v-card-subtitle>

              <v-card-text class="text-truncate">
                {{ product.description }}
              </v-card-text>

              <v-card-actions>
                <v-spacer />
                <v-btn
                  :disabled="!product.is_active"
                  color="primary"
                  variant="elevated"
                  @click="handleView(product)"
                >
                  Ver detalles
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-col>
        </v-row>
      </v-tabs-window-item>
    </v-tabs-window>

    <!-- Dialogo de producto -->
    <v-dialog v-model="productDialog" max-width="700">
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
import ProductDialog from '@/components/ProductDialog.vue';

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

<style scoped>
.text-truncate {
  max-height: 60px;
  overflow: hidden;
  text-overflow: ellipsis;
}
</style>
