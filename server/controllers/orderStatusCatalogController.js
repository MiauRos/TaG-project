import models from "../models";

export const getOrderStatus = async (req, res) => {
    try {
        const orderStatus = await models.OrderStatus.findAll();
        res.json(orderStatus);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

export const getStatusById = async (req, res) => {
    try {
        const status = await models.OrderStatus.findByPk(req.params.id);
        res.json(status);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

export const createStatus = async (req, res) => {
    try {
        const newStatus = await models.OrderStatus.create(req.body);
        res.status(201).json(newStatus);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

export const updateStatus = async (req, res) => {
    try {
        const updated = await models.OrderStatus.update(req.body, { where: { status_id: req.params.id } });
        res.json({ updated })
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

export const deleteStatus = async (req, res) => {
    try {
        await models.OrderStatus.destroy({ where: { status_id: req.params.id } });
        res.status(204).send();
    } catch (error) {
        res.status(500).json({ error: error.message })
    }
}