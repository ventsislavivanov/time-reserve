import { useState, useCallback, useEffect } from "react";
import { notify } from "../../../services/index.js";

export const useFetchList = (fetchFn, transformFn = null) => {
    const [items, setItems] = useState([]);
    const [meta, setMeta] = useState(null);
    const [links, setLinks] = useState(null);

    const [isLoading, setIsLoading] = useState(false);
    const [isRefreshing, setIsRefreshing] = useState(false);

    const fetchData = useCallback(async (silent = false) => {
        try {
            if (!silent) setIsLoading(true);
            else setIsRefreshing(true);

            const response = await fetchFn();

            const raw = response.data;

            const dataArray = Array.isArray(raw)
                ? raw
                : raw.data;

            const finalItems = transformFn
                ? transformFn(dataArray)
                : dataArray;

            setItems(finalItems);

            if (!Array.isArray(raw)) {
                setMeta(raw.meta || null);
                setLinks(raw.links || null);
            }

        } catch (error) {
            notify.error("Failed to load data");
        } finally {
            if (!silent) setIsLoading(false);
            else setIsRefreshing(false);
        }
    }, [fetchFn, transformFn]);

    useEffect(() => {
        fetchData();
    }, []);

    return {
        items,
        setItems,
        meta,
        links,
        isLoading,
        isRefreshing,
        fetchData
    };
};
