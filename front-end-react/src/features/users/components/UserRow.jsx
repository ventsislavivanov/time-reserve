import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Badge } from "@/components/ui/badge";
import { TableCell, TableRow } from "@/components/ui/table";
import { cn } from "@/lib/utils";
import { UIStatusBadge, UIRowActions } from "../../../components/common/ui";

const UserRow = ({ user, roleBadgeMap, onToggleActive, onViewDetails, onEdit }) => {
    const actions = [
        {
            id: `edit-${user.id}`,
            icon: "edit",
            variant: "outline",
            className: "rounded-full",
            size: "icon",
            title: "Edit user",
            onClick: () => onEdit(user)
        },
        {
            id: `view-${user.id}`,
            icon: "eye",
            variant: "outline",
            className: "rounded-full",
            size: "icon",
            title: "View details",
            onClick: () => onViewDetails(user)
        },
        {
            id: `toggle-${user.id}-${user.is_active}`,
            icon: user.is_active ? "ban" : "check",
            variant: user.is_active ? "outline-danger" : "outline-success",
            className: "rounded-full px-3",
            label: user.is_active ? "Block" : "Activate",
            onClick: () => onToggleActive(user.id)
        }
    ]

    return (
        <TableRow className={cn(!user.is_active && "bg-muted/40 opacity-75")}>
            <TableCell className="py-4 pl-6">
                <div className="flex items-center gap-3">
                    <div className={cn(
                        "flex size-10 items-center justify-center rounded-full",
                        user.is_active ? "bg-primary/10 text-primary" : "bg-muted text-muted-foreground"
                    )}>
                        <FontAwesomeIcon icon="user" />
                    </div>
                    <div>
                        <div className="font-semibold">{user.name}</div>
                        <div className="text-sm text-muted-foreground">ID: #{user.id}</div>
                    </div>
                </div>
            </TableCell>
            <TableCell className="py-4">
                <div className="flex max-w-52 flex-col gap-1 text-sm">
                    <span className="truncate">
                        <FontAwesomeIcon icon="envelope" className="mr-2 text-muted-foreground" />
                        {user.email}
                    </span>
                    <span className="truncate text-muted-foreground">
                        <FontAwesomeIcon icon="phone" className="mr-2" />
                        {user.phone}
                    </span>
                </div>
            </TableCell>
            <TableCell className="py-4 text-center">
                <Badge variant={roleBadgeMap[user.role] || 'muted'} className="capitalize">
                    {user.role}
                </Badge>
            </TableCell>
            <TableCell className="py-4 text-center">
                <div className="flex flex-col items-center gap-1">
                    <UIStatusBadge condition={user.is_active} trueText="Active" falseText="Blocked" />
                    <UIStatusBadge condition={user.is_approved} trueText="Approved" falseText="Pending" />
                </div>
            </TableCell>
            <TableCell className="py-4 pr-6 text-center">
                <UIRowActions actions={actions} align="center" />
            </TableCell>
        </TableRow>
    );
};

export default UserRow;
