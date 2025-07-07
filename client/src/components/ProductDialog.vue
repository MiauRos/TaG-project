<template>
  <v-card>
    <!-- HEADER -->
    <v-card-title
    class="d-flex justify-space-between align-center"
    style="position: sticky; top: 0; z-index: 1; background-color: #fff;"
    >
      <h3 class="text-h6 mb-0">{{ product.name }}</h3>
      <v-btn icon variant="flat" @click="emit('close')">
        <v-icon>mdi-close</v-icon>
      </v-btn>
    </v-card-title>

    <!-- CONTENT -->
    <v-card-text
    class="overflow-y-auto"
    style="background-color: #f5f5f5;"
    >
      <v-card class="pa-4">
        <v-row justify="center" class="mb-4">
          <v-img :src="product.image_url" height="250" contain />
        </v-row>
        <v-row>
          <v-col cols="12">
            <v-table>
              <tbody>
                <tr><td>Descripción</td><td>{{ product.description }}</td></tr>
                <tr><td>Precio</td><td>${{ product.price.toFixed(2) }}</td></tr>
                <tr><td>Stock</td><td>{{ product.stock }}</td></tr>
                <tr><td>Peso</td><td>{{ product.weight }} kg</td></tr>
                <tr><td>Dimensiones</td><td>{{ product.dimensions }} m</td></tr>
                <tr><td>Categoría</td><td>{{ product.category?.name || 'N/A' }}</td></tr>
              </tbody>
            </v-table>
          </v-col>
        </v-row>
      </v-card>
    </v-card-text>

    <!-- FOOTER -->
    <v-card-actions
    style="position: sticky; bottom: 0; z-index: 1; background-color: #fff;"
    >
      <v-row>
        <v-col cols="12" sm="6">
          <v-btn variant="outlined" block color="secondary" @click="handleAddToCart">
            Agregar al carrito
          </v-btn>
        </v-col>
        <v-col cols="12" sm="6">
          <v-btn variant="outlined" block color="primary" @click="handleBuyNow">
            Comprar ahora
          </v-btn>
        </v-col>
      </v-row>
    </v-card-actions>
  </v-card>
</template>

<script setup>
import axios from 'axios'

const props = defineProps({
  product: {
    type: Object,
    required: true
  }
});

const emit = defineEmits(['close', 'add-to-cart', 'buy-now'])
const user = JSON.parse(localStorage.getItem('user'))

const handleAddToCart = async () => {
  if (!user) {
    window.location.href = '/login'
  }

  try {
    const { data: existingCarts } = await axios.get(`http://localhost:3000/api/cart/user/${user.id}?is_staging=false&is_active=true`);
    let cart;
    if(existingCarts) {
      cart = existingCarts[0];
    } else {
      cart = await axios.post('http://localhost:3000/api/cart/', {
        user_id: user.id,
        is_staging: false,
        is_active: true
      })
    }

    await axios.post('http://localhost:3000/api/cart-details/', {
      cart_id: cart.cart_id,
      product_id: props.product.product_id,
      quantity: 1,
      total_price: props.product.price,
      updated_by: user.email,
      update_date: new Date()
    })

    emit('close');
  } catch (error) {
    console.error('Error al agregar al carrito:', error)
  }
}

const handleBuyNow = async () => {
  if (!user) {
    window.location.href = '/login'
  }

  try {
    const { data: cart } = await axios.post('http://localhost:3000/api/cart/', {
      user_id: user.id,
      is_staging: true,
      is_active: true
    })

    await axios.post('http://localhost:3000/api/cart-details/', {
      cart_id: cart.cart_id,
      product_id: props.product.product_id,
      quantity: 1,
      total_price: props.product.price,
      update_date: new Date(),
      updated_by: user.email
    })

    //emit('buy-now')
    // Redirigir a página de pago inmediato
    // window.location.href = '/cart'
  } catch (error) {
    console.error('Error al comprar ahora:', error)
  }
}
</script>

<style scoped>
.v-card {
  scrollbar-width: none;
  -ms-overflow-style: none;
  background-color: #fff;
}

.v-card-text::-webkit-scrollbar {
  width: 0px;
}
</style>
