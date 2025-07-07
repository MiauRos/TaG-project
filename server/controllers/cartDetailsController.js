import models from '../models/index.js'

export const getCartDetails = async (req, res) => {
  try {
    const cartDetails = await models.CartDetails.findAll({
      include: [
        {
          model: models.Product,
          as: 'product'
        },
        {
          model: models.Cart,
          as: 'cart'
        }
      ]
    });
    res.json(cartDetails);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

export const getCartDetailById = async (req, res) => {
  try {
    const cartDetail = await models.CartDetails.findOne({
      where: { cart_id: req.params.cartId, product_id: req.params.productId },
      include: [
        {
          model: models.Product,
          as: 'product'
        },
        {
          model: models.Cart,
          as: 'cart'
        }
      ]
    });
    if (!cartDetail) return res.status(404).json({ error: 'Detalle de carrito no encontrado' });
    res.json(cartDetail);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

export const updateCartDetail = async (req, res) => {
  try {
    const updated = await models.CartDetails.update(req.body, {
      where: { cart_id: req.params.cartId, product_id: req.params.productId }
    });
    res.json({ updated });
  } catch (error) {
    res.status(500).json({ error: 'Error al actualizar detalle de carrito' });
  }
};

export const deleteCartDetail = async (req, res) => {
  try {
    await models.CartDetails.destroy({ where: { cart_id: req.params.cartId, product_id: req.params.productId } });
    res.status(204).send();
  } catch (error) {
    res.status(500).json({ error: 'Error al eliminar detalle de carrito' });
  }
};

export const createCartDetails = async (req, res) => {
  try {
    const newCartDetails = await models.CartDetails.create(req.body);
    res.status(201).json(newCartDetails);
  } catch (error) {
    res.status(500).json({ error: 'Error al crear carrito' });
  }
};

export const getCartDetailsByCartId = async (req, res) => {
  try {
    const cartDetails = await models.CartDetails.findAll({
      where: { cart_id: req.params.cartId },
      include: [
        {
          model: models.Product,
          as: 'product'
        },
        {
          model: models.Cart,
          as: 'cart'
        }
      ]
    });
    res.json(cartDetails);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}