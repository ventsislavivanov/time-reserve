import { UIButton } from "../../index.js";

function LoadingButton({
    loading = false,
    loadingLabel = null,
    children,
    disabled,
    ...props
}) {
    return (
        <UIButton
            isLoading={loading}
            disabled={loading || disabled}
            {...props}
        >
            {loading ? (loadingLabel || children) : children}
        </UIButton>
    );
}

export default LoadingButton;
