<template>
  <div class="p-6">
    <h2 class="text-2xl font-bold mb-4">Selecciona tus productos</h2>

    <!-- Productos agrupados por categoría -->
    <div v-for="(items, category) in groupedProducts" :key="category" class="mb-8">
      <h3 class="text-xl font-bold mb-2">{{ category }}</h3>
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
                :disabled="isSelected(product)"
                @click="addProduct(product)"
                color="primary"
              >
                Agregar
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
    </div>

    <v-divider class="my-6" />

    <!-- Lista de productos seleccionados -->
    <h3 class="text-xl font-semibold mb-2">Artículos seleccionados ({{ selected.length }}/10)</h3>

    <v-list v-if="selected.length">
      <v-list-item
        v-for="(item, index) in selected"
        :key="item.product_id"
        class="d-flex justify-between"
      >
        <div>{{ item.name }} - ${{ item.price.toFixed(2) }}</div>
        <v-btn icon @click="removeProduct(index)" color="error">
          <v-icon>mdi-delete</v-icon>
        </v-btn>
      </v-list-item>
    </v-list>
    <p v-else>No has seleccionado ningún artículo</p>

    <v-divider class="my-4" />

    <!-- Botones de acción -->
    <v-btn color="green" @click="startPayment" :disabled="!selected.length">
      Comprar
    </v-btn>
    <v-btn color="red" class="ml-4" @click="cancelPurchase" :disabled="!selected.length">
      Cancelar
    </v-btn>

    <v-divider class="my-6" />

    <!-- Selección de forma de pago -->
    <div v-if="isPaying" class="my-4">
      <h3 class="text-lg font-semibold mb-2">Selecciona la forma de pago:</h3>
      <v-select
        v-model="paymentMethod"
        :items="['Tarjeta de crédito', 'PayPal', 'Efectivo']"
        label="Forma de pago"
        outlined
        dense
      ></v-select>

      <v-btn class="mt-4" color="primary" :disabled="!paymentMethod" @click="confirmPayment">
        Enviar pago
      </v-btn>
    </div>

    <!-- Confirmaciones -->
    <div v-if="paymentConfirmed" class="mt-6 text-green-600 text-lg font-bold">
      Su pedido ha sido confirmado
    </div>

    <div v-else-if="canceled" class="mt-6 text-red-500 font-bold">
      Pedido cancelado
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import axios from 'axios'

const products = ref([])
const selected = ref([])
const isPaying = ref(false)
const paymentConfirmed = ref(false)
const canceled = ref(false)
const paymentMethod = ref('')

const fetchProducts = async () => {
  const response = await axios.get('http://localhost:3000/api/products')
  products.value = response.data
}

onMounted(fetchProducts)

const groupedProducts = computed(() => {
  const groups = {}
  products.value.forEach((product) => {
    const category = product.category?.name || 'Sin categoría'
    if (!groups[category]) groups[category] = []
    groups[category].push(product)
  })
  return groups
})

const isSelected = (product) =>
  selected.value.some((item) => item.product_id === product.product_id) ||
  selected.value.length >= 10

const addProduct = (product) => {
  if (!isSelected(product)) selected.value.push(product)
}

const removeProduct = (index) => selected.value.splice(index, 1)

const startPayment = () => {
  isPaying.value = true
  paymentConfirmed.value = false
  canceled.value = false
}

const confirmPayment = () => {
  paymentConfirmed.value = true
  isPaying.value = false
}

const cancelPurchase = () => {
  selected.value = []
  isPaying.value = false
  paymentConfirmed.value = false
  canceled.value = true
}
</script>
