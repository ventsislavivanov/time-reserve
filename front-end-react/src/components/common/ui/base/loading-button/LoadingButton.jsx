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
            disabled={loading || disabled}
            {...props}
        >
            {loading ? (
                <>
                    <span className="spinner-border spinner-border-sm me-2"></span>
                    {loadingLabel || children}
                </>
            ) : (
                children
            )}
        </UIButton>
    );
}

export default LoadingButton;