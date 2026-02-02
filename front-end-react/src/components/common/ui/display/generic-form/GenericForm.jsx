import { useEffect } from "react";
import {
	UIAppForm,
	UIButton,
	UICard,
	UIInput,
	UITextarea,
	UISelect,
	UICheckbox,
	UIRadio
} from '../../index.js';
import { useAppForm } from "../../../../../hooks/index.js";

const FIELD_COMPONENTS = {
	input: UIInput,
	textarea: UITextarea,
	select: UISelect,
	checkbox: UICheckbox,
	radio: UIRadio,
};

const GenericForm = ({
 	isEditing,
 	item,
 	onSubmit,
 	onCancel,
 	title,
 	fields,
 	rules
}) => {
	const methods = useAppForm({
		defaultValues: item,
	});

	const { reset, isLoading } = methods;

	useEffect(() => {
		reset(item);
	}, [item, reset]);

	const renderField = (field) => {
		const FieldComponent = FIELD_COMPONENTS[field.type] || UIInput;

		return (
			<FieldComponent
				key={field.name}
				name={field.name}
				label={field.label}
				placeholder={field.placeholder}
				rules={rules?.[field.name]}
				{...(field.type === 'textarea' && { rows: field.rows })}
				{...(field.type === 'select' && { options: field.options })}
				{...(field.type === 'radio' && { options: field.options })}
				{...(field.type === 'checkbox' && { checked: field.checked })}
				{...(field.type === 'number' && { type: 'number' })}
				{...field.props}
			/>
		);
	};

	return (
		<UICard
			variant="primary"
			title={isEditing ? `Edit ${title}` : `Add New ${title}`}
			headerIcon={isEditing ? 'edit' : 'plus-circle'}
		>
			<UIAppForm methods={methods} onSubmit={onSubmit}>
				{fields.map(renderField)}

				<div className="d-grid gap-2">
					<UIButton
						type="submit"
						variant="success"
						isLoading={isLoading}
					>
						{isEditing ? `Update ${title}` : `Save ${title}`}
					</UIButton>

					{isEditing && (
						<UIButton
							variant="outline-secondary"
							type="button"
							isLoading={isLoading}
							onClick={onCancel}
						>
							Cancel
						</UIButton>
					)}
				</div>
			</UIAppForm>
		</UICard>
	);
};

export default GenericForm;