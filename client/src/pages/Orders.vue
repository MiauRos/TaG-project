<template>
  <v-container fluid class="pa-5 px-10">
    <template v-if="!user">
      <v-alert type="warning" border="start" variant="outlined" class="mt-6">
        Debes iniciar sesión para ver tus órdenes.
      </v-alert>
    </template>

    <template v-else>
      <h1 class="text-h5 mb-6">Mis Órdenes</h1>

      <v-alert
        v-if="orders.length === 0"
        type="info"
        variant="tonal"
        class="mb-6"
      >
        No tienes órdenes registradas.
      </v-alert>

      <v-card
        v-for="order in orders"
        :key="order.order_id"
        class="mb-6"
      >
        <v-card-title class="text-subtitle-1">
          Orden #{{ order.order_id }}
          <v-spacer />
          <v-chip :color="statusColor(order.status?.name)" variant="tonal">
            {{ order.status?.name || 'Sin estado' }}
          </v-chip>
        </v-card-title>

        <v-card-text>
          <v-row>
            <v-col cols="12" md="3">
              <p><strong>Fecha:</strong> {{ formatDate(order.creation_date) }}</p>
              <p><strong>Total:</strong> ${{ order.order_total.toFixed(2) }}</p>
              <p><strong>Tipo de envío:</strong> {{ order.shipping_type?.name || 'N/A' }}</p>
            </v-col>
            <v-col cols="12" md="3">
              <p><strong>Método de pago:</strong> {{ maskedCard(order.payment?.card_number) }}</p>
              <p><strong>Tipo de tarjeta:</strong> {{ order.payment?.card_type || 'N/A' }}</p>
              <p><strong>Fecha de expiración:</strong> {{ order.payment?.expiry_date || 'N/A' }}</p>
            </v-col>
            <v-col cols="12" md="3">
              <p><strong>Almacen:</strong> {{ order.warehouse?.name || 'N/A' }}</p>
              <p><strong>Pais de ubicacion:</strong> {{ order.warehouse?.country || 'N/A' }}</p>
              <p><strong>Direccion:</strong> {{ order.warehouse?.address || 'N/A' }}</p>
            </v-col>
            <v-col cols="12" md="3">
              <p><strong>Tipo de envio:</strong> {{ order.shipping?.name || 'N/A' }}</p>
              <p><strong>Descripcion:</strong> {{ order.shipping?.description || 'N/A' }}</p>
              <p><strong>Nombre del receptor:</strong> {{ order.receiver_name || 'N/A' }}</p>
            </v-col>
          </v-row>

          <v-divider class="my-4" />

          <div v-if="order.cart?.details?.length">
            <h4 class="text-subtitle-2 mb-2">Productos:</h4>
            <v-list density="compact">
              <v-list-item
                v-for="item in order.cart.details"
                :key="item.product_id"
              >
                <v-list-item-title>
                  {{ item.product.name }} - x{{ item.quantity }} (${{ item.total_price.toFixed(2) }})
                </v-list-item-title>
              </v-list-item>
            </v-list>
          </div>
        </v-card-text>
      </v-card>
    </template>
  </v-container>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import axios from 'axios'

const user = JSON.parse(localStorage.getItem('user'))
const orders = ref([])

const formatDate = (dateStr) => {
  const date = new Date(dateStr)
  return date.toLocaleDateString('es-MX', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  })
}

const maskedCard = (number) => {
  if (!number) return 'N/A'
  return '**** **** **** ' + number.slice(-4)
}

const statusColor = (statusName) => {
  switch (statusName) {
    case 'Pending Payment':
      return 'warning';     // #FFA726
    case 'Paid':
      return 'success';     // #66BB6A
    case 'Processing':
      return 'accent';      // #A5D6A7
    case 'Shipped':
      return 'info';        // #26C6DA
    case 'In Transit':
      return 'primary';     // #43A047
    case 'Delivered':
      return 'secondary';   // #1B5E20
    case 'Cancelled':
      return 'error';       // #EF5350
    case 'Refunded':
      return 'info';        // #26C6DA
    case 'Failed':
      return 'error';       // #EF5350
    case 'Returned':
      return 'accent';      // #A5D6A7
    default:
      return 'grey';
  }
}


onMounted(async () => {
  if (!user) return

  try {
    await axios.get(`http://localhost:3000/api/order/user/${user.id}`).then((res) => {
      orders.value = res.data
    })
  } catch (error) {
    console.error('Error al obtener órdenes:', error)
  }

  console.log(orders.value)
})
</script>
