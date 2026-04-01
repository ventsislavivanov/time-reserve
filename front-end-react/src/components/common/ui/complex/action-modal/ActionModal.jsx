import { UIModal, UIButton, UILoadingButton } from '../../../../../components/common/ui';

const ActionModal = ({
                         id,
                         title,
                         icon,
                         variantAction,
                         loading,
                         loadingLabel,
                         confirmLabel,
                         cancelLabel,
                         onConfirm,
                         onClose,
                         disableConfirm,
                         children
                     }) => {
    return (
        <UIModal
            id={id}
            title={title}
            icon={icon}
            centered
            staticBackdrop
            onClose={onClose}
            footer={
                <>
                    <UIButton variant="outline-secondary" onClick={onClose}>
                        {cancelLabel}
                    </UIButton>

                    <UILoadingButton
                        variant={variantAction}
                        onClick={onConfirm}
                        loading={loading}
                        loadingLabel={loadingLabel}
                        disabled={disableConfirm}
                    >
                        {confirmLabel}
                    </UILoadingButton>
                </>
            }
        >
            {children}
        </UIModal>
    );
};

export default ActionModal;
