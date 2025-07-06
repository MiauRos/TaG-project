import models from '../models/index.js'

export const getAllWarehouses = async (req, res) => {
    try {
        const warehouses = await models.Warehouse.findAll();
        res.json(warehouses);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

export const getWarehouseById = async (req, res) => {
    try {
        const warehouse = await models.Warehouse.findById(req.params.id);
        res.json(warehouse);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

export const createWarehouse = async (req, res) => {
    try {
        const newWarehouse = await models.Warehouse.create(req.body);
        res.status(201).json(newWarehouse);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

export const updateWarehouse = async (req, res) => {
    try {
        const updated = models.Warehouse.update(req.body, { where: { warehouse_id: req.params.id } });
        res.json({ updated })
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

export const deleteWarehouse = async (req, res) => {
    try {
        await models.Warehouse.destroy({ where: { warehouse_id: req.params.id } });
        res.status(204).send();
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}