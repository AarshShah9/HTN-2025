import { Loader2 } from 'lucide-react';
import React from 'react';

type MemoryLoadingProps = {
  message?: string;
};

const MemoryLoading: React.FC<MemoryLoadingProps> = ({
  message = "Loading your memories..."
}) => {
  return (
    <div className="flex flex-col items-center justify-center py-12">
      <Loader2 className="w-8 h-8 animate-spin text-muted-foreground mb-4" />
      <p className="text-muted-foreground">{message}</p>
    </div>
  );
};

export default MemoryLoading;