<template>
  <v-container fluid>
    <v-row>
      <v-col cols="12">
        <h2 class="text-h5 mb-4">Resumen del pedido</h2>

        <v-card v-for="item in cartItems" :key="item.product_id" class="mb-3">
          <v-card-title class="d-flex justify-space-between align-center">
            {{ item.product.name }}
            <v-chip color="primary" text-color="white">${{ item.product.price.toFixed(2) }}</v-chip>
          </v-card-title>
          <v-card-text>
            <v-img :src="item.product.image_url" height="150" contain class="mb-3" />
            <div><strong>Cantidad:</strong> {{ item.quantity }}</div>
            <div><strong>Peso:</strong> {{ item.product.weight.toFixed(2) }} kg</div>
            <div><strong>Medidas:</strong> {{ item.product.dimensions.toFixed(2) }} cm</div>
            <div><strong>Total:</strong> ${{ item.total_price.toFixed(2) }}</div>
          </v-card-text>
        </v-card>

        <v-divider class="my-4" />

        <h3 class="text-h6">Total a pagar: ${{ total.toFixed(2) }}</h3>
        <v-btn color="primary" class="mt-4" @click="showPaymentDialog = true">Comprar</v-btn>
      </v-col>
    </v-row>

    <payment-dialog
      v-if="showPaymentDialog"
      @close="showPaymentDialog = false"
      @confirm="submitPayment"
    />
  </v-container>
</template>

<script setup>
import { onMounted, ref } from 'vue';
import axios from 'axios';
import { useRouter } from 'vue-router';
import PaymentDialog from '@/components/PaymentDialog.vue';

const router = useRouter();
const user = JSON.parse(localStorage.getItem('user'));
const cartId = localStorage.getItem('staging_cart_id');
const cartItems = ref([]);
const total = ref(0);
const showPaymentDialog = ref(false);

onMounted(async () => {
  if (!user || !cartId) {
    await router.push('/login');
  }

  const { data } = await axios.get(`http://localhost:3000/api/cart-details/${cartId}`)
  cartItems.value = data
  total.value = data.reduce((acc, item) => acc + item.total_price, 0)
})

const submitPayment = async (paymentId) => {
  try {

    await axios.post('http://localhost:3000/api/order', {
      cart_id: cartId,
      user_id: user.id,
      payment_id: paymentId,
      status_id: 2,
      shipping_id: Math.floor(Math.random() * (3)) + 1,
      warehouse_id: Math.floor(Math.random() * (5)) + 1,
      receiver_name: user.name,
      order_total: total.value,
      created_by: user.email,
    })

    await axios.put(`http://localhost:3000/api/cart/${cartId}`, {
      is_active: false
    });
    localStorage.removeItem('staging_cart_id')
    alert('Su pedido ha sido confirmado.')
    await router.push('/')
  } catch (error) {
    console.error('Error al procesar pago:', error)
    alert('Ocurrió un error al procesar su pedido.')
  }
}
</script>
