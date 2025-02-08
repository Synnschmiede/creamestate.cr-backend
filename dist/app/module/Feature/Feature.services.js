"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.FeatureServices = void 0;
const common_1 = require("../../constants/common");
const prisma_1 = __importDefault(require("../../shared/prisma"));
const fieldValidityChecker_1 = __importDefault(require("../../utils/fieldValidityChecker"));
const pagination_1 = __importDefault(require("../../utils/pagination"));
const Feature_constants_1 = require("./Feature.constants");
const addFeature = (data) => __awaiter(void 0, void 0, void 0, function* () {
    const result = yield prisma_1.default.feature.create({
        data
    });
    return result;
});
const getFeatures = (query) => __awaiter(void 0, void 0, void 0, function* () {
    const { searchTerm, page, limit, sortBy, sortOrder, id } = query;
    if (sortBy) {
        (0, fieldValidityChecker_1.default)(Feature_constants_1.featureSortableFields, sortBy);
    }
    if (sortOrder) {
        (0, fieldValidityChecker_1.default)(common_1.sortOrderType, sortOrder);
    }
    const { pageNumber, limitNumber, skip, sortWith, sortSequence } = (0, pagination_1.default)({
        page,
        limit,
        sortBy,
        sortOrder,
    });
    const andConditions = [];
    if (id)
        andConditions.push({
            id,
        });
    if (searchTerm) {
        andConditions.push({
            OR: Feature_constants_1.featureSearchableFields.map((field) => ({
                [field]: {
                    contains: searchTerm,
                    mode: "insensitive",
                },
            })),
        });
    }
    const whereConditons = {
        AND: andConditions,
    };
    const result = yield prisma_1.default.feature.findMany({
        where: whereConditons,
        skip,
        take: limitNumber,
        orderBy: {
            [sortWith]: sortSequence,
        }
    });
    const total = yield prisma_1.default.feature.count({ where: whereConditons });
    return {
        meta: {
            page: pageNumber,
            limit: limitNumber,
            total,
        },
        data: result,
    };
});
const updateFeature = (id, payload) => __awaiter(void 0, void 0, void 0, function* () {
    const result = yield prisma_1.default.feature.update({
        where: {
            id
        },
        data: payload
    });
    return result;
});
const deleteFeatures = (_a) => __awaiter(void 0, [_a], void 0, function* ({ ids }) {
    const result = yield prisma_1.default.feature.deleteMany({
        where: {
            id: {
                in: ids
            }
        }
    });
    return {
        deleted_count: result.count,
        message: `${result.count} feature deleted successfully`
    };
});
exports.FeatureServices = { addFeature, getFeatures, updateFeature, deleteFeatures };
