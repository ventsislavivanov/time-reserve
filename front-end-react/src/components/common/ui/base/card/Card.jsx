import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Card, CardContent, CardFooter, CardHeader, CardTitle } from "@/components/ui/card";
import { cn } from "@/lib/utils";

const HEADER_VARIANTS = {
    primary: 'bg-primary text-primary-foreground',
    success: 'bg-success text-success-foreground',
    danger: 'bg-destructive text-white',
    warning: 'bg-warning text-warning-foreground',
    info: 'bg-primary text-primary-foreground',
    dark: 'bg-foreground text-background',
    secondary: 'bg-secondary text-secondary-foreground',
};

const UICard = ({
    children,
    title,
    headerIcon,
    headerActions,
    footer,
    className = '',
    headerClassName = '',
    bodyClassName = '',
    variant = '',
    ...props
}) => {
    return (
        <Card className={cn('gap-0 overflow-hidden py-0 shadow-sm', className)} {...props}>
            {(title || headerIcon || headerActions) && (
                <CardHeader
                    className={cn(
                        'flex flex-row items-center justify-between border-b py-4',
                        variant && HEADER_VARIANTS[variant],
                        headerClassName
                    )}
                >
                    <CardTitle className="flex items-center gap-2 text-base font-semibold">
                        {headerIcon && <FontAwesomeIcon icon={headerIcon} />}
                        {title}
                    </CardTitle>
                    {headerActions && <div>{headerActions}</div>}
                </CardHeader>
            )}
            <CardContent className={cn('p-6', bodyClassName)}>
                {children}
            </CardContent>
            {footer && (
                <CardFooter className="border-t bg-muted/30 py-4">
                    {footer}
                </CardFooter>
            )}
        </Card>
    );
};

export default UICard;
