import models from '../models/index.js';

export const getShippingTypes = async (req, res) => {
  try {
    const shippingTypes = await models.ShippingType.findAll();
    res.json(shippingTypes);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

export const getShippingTypeById = async (req, res) => {
  try {
    const shippingType = await models.ShippingType.findOne({
      where: { id: req.params.id }
    });
    if (!shippingType) return res.status(404).json({ error: 'Tipo de envío no encontrado' });
    res.json(shippingType);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

export const createShippingType = async (req, res) => {
  try {
    const newShippingType = await models.ShippingType.create(req.body);
    res.status(201).json(newShippingType);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

export const updateShippingType = async (req, res) => {
  try {
    const [updated] = await models.ShippingType.update(req.body, {
      where: { id: req.params.id }
    });
    if (!updated) return res.status(404).json({ error: 'Tipo de envío no encontrado' });
    res.json({ message: 'Tipo de envío actualizado correctamente' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

export const deleteShippingType = async (req, res) => {
  try {
    const deleted = await models.ShippingType.destroy({
      where: { id: req.params.id }
    });
    if (!deleted) return res.status(404).json({ error: 'Tipo de envío no encontrado' });
    res.status(204).send();
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};