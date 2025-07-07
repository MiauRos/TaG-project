<template>
  <v-container fluid class="pa-6">
    <!-- No logueado -->
    <template v-if="!user">
      <v-alert type="warning" border="start" variant="outlined" class="mt-6">
        Debes iniciar sesión para ver tu carrito de compras.
      </v-alert>
    </template>

    <!-- Carrito vacío -->
    <template v-else-if="cartItems.length <= 0">
      <v-alert type="info" border="start" variant="outlined" class="mt-6">
        Agrega productos a tu carrito para comenzar a comprar.
      </v-alert>
    </template>

    <!-- Carrito con productos -->
    <template v-else>
      <h1 class="text-h4 font-weight-bold text-primary mb-2">Carrito de compras</h1>

      <v-row dense>
        <v-col
          cols="12"
          md="6"
          lg="4"
          v-for="item in cartItems"
          :key="item.product_id"
        >
          <v-card elevation="2" class="mb-4">
            <v-img
              :src="item.product.image_url"
              height="180"
              contain
            />
            <v-card-title class="d-flex justify-space-between align-center">
              <span class="font-weight-medium">{{ item.product.name }}</span>
              <v-chip color="primary" text-color="white">${{ item.product.price.toFixed(2) }}</v-chip>
            </v-card-title>
            <v-card-text>
              <div class="mb-2"><strong>Cantidad:</strong> {{ item.quantity }}</div>
              <div class="mb-2"><strong>Total:</strong> ${{ item.total_price.toFixed(2) }}</div>
              <div class="text-truncate"><strong>Descripción:</strong> {{ item.product.description }}</div>
            </v-card-text>
            <v-card-actions>
              <v-spacer />
              <v-btn variant="text" color="error" @click="confirmDelete(item)">
                <v-icon start>mdi-delete</v-icon> Eliminar
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>

      <!-- Total y botón de comprar -->
      <v-divider class="my-4" />
      <v-row align="center" justify="space-between">
        <v-col cols="12" md="6">
          <h3 class="text-h6">Total a pagar: <strong>${{ total.toFixed(2) }}</strong></h3>
        </v-col>
        <v-col cols="12" md="6" class="text-md-right">
          <v-btn color="success" class="mt-2" size="large" @click="showPaymentDialog = true">
            <v-icon start>mdi-credit-card-outline</v-icon> Comprar
          </v-btn>
        </v-col>
      </v-row>
    </template>

    <!-- Diálogo de confirmación de eliminación -->
    <v-dialog v-model="confirmDialog" max-width="400">
      <v-card>
        <v-card-title class="text-h6">¿Eliminar producto del carrito?</v-card-title>
        <v-card-text>
          Esta acción eliminará el producto <strong>{{ itemToDelete?.product?.name }}</strong> del carrito.
        </v-card-text>
        <v-card-actions>
          <v-spacer />
          <v-btn variant="text" color="grey" @click="confirmDialog = false">Cancelar</v-btn>
          <v-btn variant="flat" color="red" @click="deleteItem">Eliminar</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

    <!-- Snackbar -->
    <v-snackbar v-model="snackbar.visible" :timeout="3000" :color="snackbar.color">
      {{ snackbar.message }}
      <template #actions>
        <v-btn icon @click="snackbar.visible = false">
          <v-icon>mdi-close</v-icon>
        </v-btn>
      </template>
    </v-snackbar>

    <!-- Diálogo de pago -->
    <payment-dialog
      v-if="showPaymentDialog"
      @close="showPaymentDialog = false"
      @confirm="finalizeOrder"
    />
  </v-container>
</template>

<script setup>
import axios from 'axios';
import { ref, computed, onBeforeMount } from 'vue';
import PaymentDialog from '@/components/PaymentDialog.vue';

const cartItems = ref([]);
const user = JSON.parse(localStorage.getItem('user'));
const confirmDialog = ref(false);
const itemToDelete = ref(null);
const showPaymentDialog = ref(false);

const snackbar = ref({
  visible: false,
  message: '',
  color: '',
});

const total = computed(() =>
  cartItems.value.reduce((sum, item) => sum + item.total_price, 0)
);

const fetchCart = async () => {
  try {
    const { data: carts } = await axios.get(`http://localhost:3000/api/cart/user/${user.id}?is_staging=false&is_active=true`);
    const { data: details } = await axios.get(`http://localhost:3000/api/cart-details/${carts[0].cart_id}`);
    cartItems.value = details;
  } catch (error) {
    console.error('Error al obtener carrito:', error);
  }
};

const deleteItem = async () => {
  try {
    const { cart_id, product_id } = itemToDelete.value;
    await axios.delete(`http://localhost:3000/api/cart-details/${cart_id}/${product_id}`);
    cartItems.value = cartItems.value.filter(
      item => item.cart_id !== cart_id || item.product_id !== product_id
    );
    confirmDialog.value = false;

    snackbar.value.message = 'Producto eliminado del carrito';
    snackbar.value.visible = true;
    snackbar.value.color = 'success';
  } catch (error) {
    console.error('Error al eliminar producto del carrito:', error);
    snackbar.value.message = 'Error al eliminar producto del carrito';
    snackbar.value.visible = true;
    snackbar.value.color = 'error';
  }
};

const confirmDelete = (item) => {
  itemToDelete.value = item;
  confirmDialog.value = true;
};

const finalizeOrder = async (paymentId) => {
  try {
    await axios.post('http://localhost:3000/api/order', {
      user_id: user.id,
      status_id: 2,
      shipping_id: Math.floor(Math.random() * 3) + 1,
      payment_id: paymentId,
      cart_id: cartItems.value[0].cart_id,
      warehouse_id: Math.floor(Math.random() * 5) + 1,
      receiver_name: user.name,
      order_total: total.value,
      created_by: user.email,
    });

    await axios.put(`http://localhost:3000/api/cart/${cartItems.value[0].cart_id}`, {
      is_active: false
    });

    snackbar.value.message = '¡Gracias por tu compra!';
    snackbar.value.visible = true;
    snackbar.value.color = 'success';
    cartItems.value = [];
    showPaymentDialog.value = false;
  } catch (err) {
    console.error(err);
    snackbar.value.message = 'Error al generar el pedido';
    snackbar.value.visible = true;
    snackbar.value.color = 'error';
  }
};

onBeforeMount(async () => {
  if (user) {
    await fetchCart();
  }
})
</script>

<style scoped>
.text-truncate {
  max-height: 60px;
  overflow: hidden;
  text-overflow: ellipsis;
}
</style>
