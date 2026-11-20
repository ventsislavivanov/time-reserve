import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { Loader2 } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { cn } from '@/lib/utils';

// Maps the legacy variant names to the new design system.
const VARIANTS = {
    primary: { variant: 'default' },
    default: { variant: 'default' },
    secondary: { variant: 'secondary' },
    success: { variant: 'success' },
    danger: { variant: 'destructive' },
    warning: { variant: 'warning' },
    info: { variant: 'default' },
    dark: { variant: 'default', className: 'bg-foreground text-background hover:bg-foreground/90' },
    light: { variant: 'outline' },
    link: { variant: 'link' },
    ghost: { variant: 'ghost' },
    outline: { variant: 'outline' },
    'outline-primary': { variant: 'outline', className: 'border-primary/40 text-primary hover:bg-primary hover:text-primary-foreground' },
    'outline-secondary': { variant: 'outline' },
    'outline-success': { variant: 'outline', className: 'border-success/40 text-success hover:bg-success hover:text-success-foreground' },
    'outline-danger': { variant: 'outline', className: 'border-destructive/40 text-destructive hover:bg-destructive hover:text-white' },
    'outline-warning': { variant: 'outline', className: 'border-warning/60 text-warning-foreground hover:bg-warning dark:text-warning dark:hover:text-warning-foreground' },
    'outline-info': { variant: 'outline', className: 'border-primary/40 text-primary hover:bg-primary hover:text-primary-foreground' },
    'outline-dark': { variant: 'outline', className: 'hover:bg-foreground hover:text-background' },
};

const SIZES = { sm: 'sm', lg: 'lg', icon: 'icon', default: 'default', '': 'default' };

const UIButton = ({
    children,
    type = 'button',
    variant = 'primary',
    size = '',
    className = '',
    onClick,
    disabled = false,
    isLoading = false,
    icon = [],
    iconClassName = '',
    ...props
}) => {
    const mapped = VARIANTS[variant] ?? VARIANTS.primary;
    const hasIcon = icon && (Array.isArray(icon) ? icon.length > 0 : typeof icon === 'string');

    return (
        <Button
            type={type}
            variant={mapped.variant}
            size={SIZES[size] ?? 'default'}
            className={cn(mapped.className, className)}
            onClick={onClick}
            disabled={disabled || isLoading}
            {...props}
        >
            {isLoading ? <Loader2 className="animate-spin" aria-hidden="true" /> : (
                hasIcon && <FontAwesomeIcon icon={icon} className={iconClassName} />
            )}
            {children}
        </Button>
    );
};

export default UIButton;
